import React, { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { storage } from "./core/storage";
import { ChildProfile, ParentAccount, CategoryId } from "./types";
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

export default function App() {
  const [parentAccount, setParentAccount] = useState<ParentAccount | null>(null);
  const [childrenList, setChildrenList] = useState<ChildProfile[]>([]);
  const [activeChildId, setActiveChildId] = useState<string | null>(null);
  const [currentMode, setCurrentMode] = useState<"child" | "parent" | "select-child">("child");
  const [activeChildTab, setActiveChildTab] = useState<NavTab>("home");
  const [selectedCategoryFromHome, setSelectedCategoryFromHome] = useState<CategoryId | undefined>(undefined);

  // Modals
  const [isParentGateOpen, setIsParentGateOpen] = useState(false);
  const [isStreakModalOpen, setIsStreakModalOpen] = useState(false);
  const [isRestBreakOpen, setIsRestBreakOpen] = useState(false);

  // Muat data tersimpan saat aplikasi dibuka.
  // Pengguna baru akan melihat layar pendaftaran orang tua (data contoh hanya lewat tombol demo).
  useEffect(() => {
    refreshAllData();
  }, []);

  const refreshAllData = () => {
    const parent = storage.getParentAccount();
    const children = storage.getChildren();
    const activeId = storage.getActiveChildId();

    setParentAccount(parent);
    setChildrenList(children);

    if (activeId && children.some((c) => c.id === activeId)) {
      setActiveChildId(activeId);
    } else if (children.length > 0) {
      setActiveChildId(children[0].id);
      storage.setActiveChildId(children[0].id);
    }
  };

  const activeChild = childrenList.find((c) => c.id === activeChildId) || childrenList[0];

  // Screen time tracking tick (every 10 seconds)
  useEffect(() => {
    if (!activeChild || currentMode !== "child") return;

    const timer = setInterval(() => {
      const child = storage.getChild(activeChild.id);
      if (!child) return;
      child.todaySecondsPlayed += 10;
      storage.saveChild(child);

      // Check daily limit if set (> 0)
      if (
        child.dailyLimitMin > 0 &&
        child.todaySecondsPlayed >= child.dailyLimitMin * 60 &&
        !isRestBreakOpen
      ) {
        setIsRestBreakOpen(true);
      }
    }, 10000);

    return () => clearInterval(timer);
  }, [activeChild, currentMode, isRestBreakOpen]);

  // Handle Parent Gate Success -> Switch to Parent Dashboard
  const handleParentGateSuccess = () => {
    setIsParentGateOpen(false);
    setCurrentMode("parent");
  };

  // If no parent account created yet
  if (!parentAccount) {
    return (
      <ParentAuthScreen
        onAuthSuccess={() => {
          refreshAllData();
          setCurrentMode("child");
        }}
      />
    );
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
        onRefreshData={refreshAllData}
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
          // Add 15 mins extra extension
          const child = storage.getChild(activeChild.id);
          if (child) {
            child.dailyLimitMin += 15;
            storage.saveChild(child);
            refreshAllData();
          }
        }}
      />
    </div>
  );
}
