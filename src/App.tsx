import React, { useState, useEffect, useRef } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { storage } from "./core/storage";
import { cloudSync } from "./core/cloudSync";
import { AppUser, ChildProfile, ParentAccount, CategoryId } from "./types";
import { StatusHeader } from "./components/StatusHeader";
import { ChildSideNav, NavTab } from "./components/ChildSideNav";
import { ParentGateModal } from "./components/ParentGateModal";
import { DailyStreakModal } from "./components/DailyStreakModal";
import { RestBreakModal } from "./components/RestBreakModal";
import { ChildHome } from "./features/child/ChildHome";
import { LearningLibrary } from "./features/child/LearningLibrary";
import { ModePlay } from "./features/child/ModePlay";
import { ChildAchievements } from "./features/child/ChildAchievements";
import { ChildRewards } from "./features/child/ChildRewards";
import { ChildProfileView } from "./features/child/ChildProfileView";
import { ParentDashboard } from "./features/parent/ParentDashboard";
import { SelectChildScreen } from "./features/auth/SelectChildScreen";
import { ParentAuthScreen } from "./features/auth/ParentAuthScreen";
import { FirstChildScreen } from "./features/auth/FirstChildScreen";

export default function App() {
  const [parentAccount, setParentAccount] = useState<ParentAccount | null>(null);
  const [childrenList, setChildrenList] = useState<ChildProfile[]>([]);
  const [activeChildId, setActiveChildId] = useState<string | null>(null);
  const [currentMode, setCurrentMode] = useState<"child" | "parent" | "select-child">("child");
  const [isAuthLoading, setIsAuthLoading] = useState(true);
  const [activeChildTab, setActiveChildTab] = useState<NavTab>("home");
  const [selectedCategoryFromHome, setSelectedCategoryFromHome] = useState<CategoryId | undefined>(undefined);

  // Modals
  const [isParentGateOpen, setIsParentGateOpen] = useState(false);
  const [isStreakModalOpen, setIsStreakModalOpen] = useState(false);
  const [isRestBreakOpen, setIsRestBreakOpen] = useState(false);
  const sessionSecondsRef = useRef(0);
  const snoozeUntilSecondsRef = useRef<number | null>(null);

  // Reset penghitung sesi setiap kali anak berganti atau kembali ke mode anak
  useEffect(() => {
    sessionSecondsRef.current = 0;
    snoozeUntilSecondsRef.current = null;
    setIsRestBreakOpen(false);
  }, [activeChildId, currentMode]);

  // Teruskan setiap perubahan data anak ke lapisan sinkronisasi D1.
  useEffect(() => {
    storage.setMutationListener((kind, childId) => cloudSync.markDirty(kind, childId));
    return () => storage.setMutationListener(null);
  }, []);

  // Pulihkan sesi login orang tua dari cookie server (akun dibuat admin di web admin).
  useEffect(() => {
    let cancelled = false;
    fetch("/api/auth/me", { credentials: "same-origin" })
      .then(async (response) => {
        if (!response.ok) throw new Error("Belum masuk.");
        const body: unknown = await response.json();
        const user =
          body && typeof body === "object" && "user" in body
            ? (body as { user: AppUser }).user
            : null;
        if (!user) throw new Error("Sesi tidak valid.");
        return user;
      })
      .then((user) => {
        if (!cancelled) void finishLogin(user);
      })
      .catch(() => {
        if (!cancelled) setIsAuthLoading(false);
      });
    return () => {
      cancelled = true;
    };
  }, []);

  // Simpan identitas login ke peramban lalu muat profil anak milik akun tersebut.
  const finishLogin = async (user: AppUser) => {
    const saved = storage.getParentAccount();
    const sameAccount = Boolean(saved && saved.id === user.id);
    const account: ParentAccount = {
      id: user.id,
      name: user.name,
      email: user.email,
      username: user.username,
      passwordHash: "",
      pinHash: sameAccount && saved ? saved.pinHash : "",
      createdAt: sameAccount && saved ? saved.createdAt : new Date().toISOString(),
    };
    storage.setParentAccount(account);
    setParentAccount(account);

    // Ambil data terbaru dari server agar perangkat lain melihat progres yang sama.
    await cloudSync.hydrate(account.id).catch(() => undefined);

    const children = storage.getChildren().filter((child) => child.parentId === account.id);
    setChildrenList(children);
    const activeId = storage.getActiveChildId();
    if (activeId && children.some((child) => child.id === activeId)) {
      setActiveChildId(activeId);
    } else if (children.length > 0) {
      setActiveChildId(children[0].id);
      storage.setActiveChildId(children[0].id);
    } else {
      setActiveChildId(null);
    }
    setCurrentMode("child");
    setIsAuthLoading(false);
  };

  const refreshAllData = () => {
    if (!parentAccount) return;
    const children = storage.getChildren().filter(
      (child) => child.parentId === parentAccount.id
    );
    setChildrenList(children);
    const activeId = storage.getActiveChildId();
    if (activeId && children.some((child) => child.id === activeId)) {
      setActiveChildId(activeId);
    } else if (children.length > 0) {
      setActiveChildId(children[0].id);
      storage.setActiveChildId(children[0].id);
    } else {
      setActiveChildId(null);
    }
  };

  const activeChild = childrenList.find((c) => c.id === activeChildId) || childrenList[0];

  // Screen time tracking tick (setiap 10 detik)
  useEffect(() => {
    if (!activeChild || currentMode !== "child") return;

    const timer = setInterval(() => {
      const child = storage.getChild(activeChild.id);
      if (!child) return;

      sessionSecondsRef.current += 10;
      child.todaySecondsPlayed = (child.todaySecondsPlayed || 0) + 10;
      child.lastActiveDate = new Date().toISOString().slice(0, 10);
      storage.saveChild(child);

      // Batas waktu tidak aktif jika dailyLimitMin <= 0 (Tanpa Batas)
      if (child.dailyLimitMin <= 0) return;

      // Jangan pernah memunculkan waktu istirahat saat anak baru saja masuk aplikasi!
      // Anak harus bermain minimal 10 menit dalam sesi ini sebelum diingatkan istirahat.
      const MIN_SESSION_SECONDS_BEFORE_BREAK = 10 * 60; // 10 menit
      if (sessionSecondsRef.current < MIN_SESSION_SECONDS_BEFORE_BREAK) return;

      // Jika sedang dalam masa jeda (snooze) setelah anak menekan 'Lanjut Bermain'
      if (
        snoozeUntilSecondsRef.current !== null &&
        child.todaySecondsPlayed < snoozeUntilSecondsRef.current
      ) {
        return;
      }

      // Tampilkan jeda istirahat jika waktu bermain hari ini telah mencapai batas harian
      if (
        child.todaySecondsPlayed >= child.dailyLimitMin * 60 &&
        !isRestBreakOpen
      ) {
        setIsRestBreakOpen(true);
      }
    }, 10000);

    return () => clearInterval(timer);
  }, [activeChild?.id, currentMode, isRestBreakOpen]);

  // Handle Parent Gate Success -> Switch to Parent Dashboard
  const handleParentGateSuccess = () => {
    setIsParentGateOpen(false);
    setCurrentMode("parent");
  };

  const handleLogout = async () => {
    await cloudSync.flushNow().catch(() => undefined);
    cloudSync.reset();
    void fetch("/api/auth/logout", { method: "POST", credentials: "same-origin" }).catch(
      () => undefined
    );
    setParentAccount(null);
    setChildrenList([]);
    setActiveChildId(null);
    setCurrentMode("child");
  };

  if (isAuthLoading) {
    return (
      <div className="min-h-screen grid place-items-center bg-child-pattern">
        <p className="rounded-2xl bg-white/90 px-6 py-4 text-sm font-bold text-[#25476A] shadow-md">
          Memuat sesi login...
        </p>
      </div>
    );
  }

  // Pendaftaran hanya dari web admin; halaman utama hanya menerima username + kata sandi.
  if (!parentAccount) {
    return <ParentAuthScreen onAuthSuccess={finishLogin} />;
  }

  // Profile Selection Screen (Reference 1 Bottom Pattern)
  if (currentMode === "select-child") {
    return (
      <>
        <SelectChildScreen
          childrenList={childrenList}
          onSelectChild={(childId) => {
            storage.setActiveChildId(childId);
            setActiveChildId(childId);
            setCurrentMode("child");
            setActiveChildTab("home");
          }}
          onAddChild={() => {
            setIsParentGateOpen(true);
          }}
          onOpenParentGate={() => setIsParentGateOpen(true)}
        />
        <ParentGateModal
          isOpen={isParentGateOpen}
          onClose={() => setIsParentGateOpen(false)}
          onSuccess={handleParentGateSuccess}
        />
      </>
    );
  }

  // Parent Mode Dashboard
  if (currentMode === "parent" && activeChild) {
    return (
      <ParentDashboard
        parent={parentAccount}
        activeChild={activeChild}
        childrenList={childrenList}
        onSelectChild={(id) => {
          storage.setActiveChildId(id);
          setActiveChildId(id);
          refreshAllData();
        }}
        onReturnToChildMode={() => setCurrentMode("child")}
        onLogout={handleLogout}
        onRefreshData={refreshAllData}
      />
    );
  }

  // Akun baru dari admin: orang tua menambahkan profil anak pertama.
  if (childrenList.length === 0) {
    return (
      <FirstChildScreen
        parent={parentAccount}
        onDone={refreshAllData}
        onLogout={handleLogout}
      />
    );
  }

  // Fallback if no active child
  if (!activeChild) {
    return (
      <SelectChildScreen
        childrenList={childrenList}
        onSelectChild={(childId) => {
          storage.setActiveChildId(childId);
          setActiveChildId(childId);
          setCurrentMode("child");
        }}
        onAddChild={() => setIsParentGateOpen(true)}
        onOpenParentGate={() => setIsParentGateOpen(true)}
      />
    );
  }

  // MAIN CHILD ENVIRONMENT (Strict Child Mode)
  return (
    <div className="min-h-screen flex flex-col bg-child-pattern text-[#25476A] relative overflow-x-hidden">
      {/* 
        Sticky Header: Flush at top (top-0), follows scroll.
        Unified bar with utility buttons on the left and stats pills on the right.
        Offset on tablet/desktop (md:pl-24 lg:pl-28) to stay cleanly to the right of the sidebar.
      */}
      <div className="sticky top-0 z-40 w-full md:pl-24 lg:pl-28">
        <StatusHeader
          child={activeChild}
          onOpenParentGate={() => setIsParentGateOpen(true)}
          onOpenStreakModal={() => setIsStreakModalOpen(true)}
          pageHelpText={`Halo ${activeChild.nickname}! Sentuh kartu yang kamu sukai untuk mulai belajar dan bermain bersama Bimo!`}
        />
      </div>

      {/* Main Body with Responsive Sidebar (bottom on mobile, left on tablet/desktop) */}
      <div className="flex-1 flex flex-col md:flex-row">
        {/* Navigation Bar */}
        <ChildSideNav
          activeTab={activeChildTab}
          onSelectTab={(tab) => {
            setActiveChildTab(tab);
            setSelectedCategoryFromHome(undefined);
          }}
        />

        {/* 
          Main Content View:
          - Full natural width on mobile (px-3 sm:px-5), eliminating the side button squeeze!
          - Proper top padding (pt-4 sm:pt-6) so star points and cards have healthy breathing room
          - Tablet/Desktop offset (md:pl-28 lg:pl-32 md:pr-6 lg:pr-8)
          - Safe bottom padding for mobile nav bar (pb-24 md:pb-10)
        */}
        <main className="flex-1 w-full min-h-[calc(100vh-60px)] pt-4 sm:pt-6 pb-24 md:pb-10 px-3.5 sm:px-5 md:pl-28 lg:pl-32 md:pr-6 lg:pr-8 overflow-y-auto">
          <AnimatePresence mode="wait">
            <motion.div
              key={activeChildTab}
              initial={{ opacity: 0, y: 12, scale: 0.99 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{ opacity: 0, y: -10, scale: 0.99 }}
              transition={{ duration: 0.28, ease: "easeOut" }}
              className="w-full"
            >
              {activeChildTab === "home" && (
                <ChildHome
                  child={activeChild}
                  onNavigateTab={(tab) => {
                    setActiveChildTab(tab);
                    setSelectedCategoryFromHome(undefined);
                  }}
                  onSelectCategory={(catId) => {
                    setSelectedCategoryFromHome(catId);
                    setActiveChildTab("library");
                  }}
                />
              )}

              {activeChildTab === "library" && (
                <LearningLibrary
                  child={activeChild}
                  initialCategory={selectedCategoryFromHome}
                  onBackToHome={() => setActiveChildTab("home")}
                />
              )}

              {activeChildTab === "play" && (
                <ModePlay
                  child={activeChild}
                  onBackToHome={() => setActiveChildTab("home")}
                />
              )}

              {activeChildTab === "achievements" && (
                <ChildAchievements
                  child={activeChild}
                  onProfileUpdated={() => refreshAllData()}
                />
              )}

              {activeChildTab === "rewards" && (
                <ChildRewards
                  child={activeChild}
                  onProfileUpdated={() => {
                    refreshAllData();
                  }}
                />
              )}

              {activeChildTab === "profile" && (
                <ChildProfileView
                  child={activeChild}
                  onSwitchProfile={() => setCurrentMode("select-child")}
                  onProfileUpdated={() => refreshAllData()}
                />
              )}
            </motion.div>
          </AnimatePresence>
        </main>
      </div>

      {/* Parental Gate Modal */}
      <ParentGateModal
        isOpen={isParentGateOpen}
        onClose={() => setIsParentGateOpen(false)}
        onSuccess={handleParentGateSuccess}
      />

      {/* Daily Streak Modal */}
      <DailyStreakModal
        isOpen={isStreakModalOpen}
        child={activeChild}
        onClose={() => setIsStreakModalOpen(false)}
      />

      {/* Rest Break Modal (Daily Time Limit Reached) */}
      <RestBreakModal
        isOpen={isRestBreakOpen}
        onContinue={() => {
          setIsRestBreakOpen(false);
          // Berikan perpanjangan waktu 15 menit bermain untuk sesi ini tanpa merusak konfigurasi batas waktu orang tua
          const currentPlayed = storage.getChild(activeChild.id)?.todaySecondsPlayed || 0;
          snoozeUntilSecondsRef.current = currentPlayed + 15 * 60;
          sessionSecondsRef.current = 0;
        }}
      />
    </div>
  );
}
