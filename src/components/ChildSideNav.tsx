import React from "react";
import { Home, BookOpen, Gamepad2, Trophy, Gift, User } from "lucide-react";
import { audio } from "../core/audio";

export type NavTab = "home" | "library" | "play" | "achievements" | "rewards" | "profile" | "stories";

interface ChildSideNavProps {
  activeTab: NavTab;
  onSelectTab: (tab: NavTab) => void;
}

export const ChildSideNav: React.FC<ChildSideNavProps> = ({
  activeTab,
  onSelectTab,
}) => {
  const navItems: { id: NavTab; label: string; icon: React.ReactNode; color: string }[] = [
    {
      id: "home",
      label: "Beranda",
      icon: <Home className="w-5 h-5 sm:w-6 sm:h-6" />,
      color: "from-sky-400 to-blue-500",
    },
    {
      id: "library",
      label: "Belajar",
      icon: <BookOpen className="w-5 h-5 sm:w-6 sm:h-6" />,
      color: "from-emerald-400 to-green-500",
    },
    {
      id: "play",
      label: "Main",
      icon: <Gamepad2 className="w-5 h-5 sm:w-6 sm:h-6" />,
      color: "from-amber-400 to-orange-500",
    },
    {
      id: "achievements",
      label: "Piala",
      icon: <Trophy className="w-5 h-5 sm:w-6 sm:h-6" />,
      color: "from-purple-400 to-indigo-500",
    },
    {
      id: "rewards",
      label: "Hadiah",
      icon: <Gift className="w-5 h-5 sm:w-6 sm:h-6" />,
      color: "from-pink-400 to-rose-500",
    },
    {
      id: "profile",
      label: "Profil",
      icon: <User className="w-5 h-5 sm:w-6 sm:h-6" />,
      color: "from-cyan-400 to-teal-500",
    },
  ];

  const handleTabClick = (id: NavTab) => {
    audio.playTapSound();
    onSelectTab(id);
  };

  return (
    <nav
      aria-label="Navigasi Utama Anak"
      className="fixed bottom-0 left-0 right-0 z-30 md:top-0 md:bottom-0 md:right-auto md:w-24 lg:w-28 bg-white/95 backdrop-blur-md border-t-2 md:border-t-0 md:border-r-2 border-sky-100 flex md:flex-col items-center justify-around md:justify-start gap-1 md:gap-3 p-1.5 md:py-5 shadow-lg select-none transition-all"
    >
      {navItems.map((item) => {
        const isActive = activeTab === item.id;
        return (
          <button
            key={item.id}
            onClick={() => handleTabClick(item.id)}
            className={`flex flex-col items-center justify-center p-1 sm:p-2 rounded-2xl w-full max-w-[64px] sm:max-w-[76px] transition-all duration-200 select-none ${
              isActive
                ? "bg-amber-100/90 text-amber-900 font-extrabold shadow-xs scale-105 border-2 border-amber-300"
                : "text-slate-600 hover:text-slate-900 hover:bg-sky-50 active:scale-95"
            }`}
          >
            <div
              className={`w-9 h-9 sm:w-11 sm:h-11 rounded-xl sm:rounded-2xl flex items-center justify-center transition-all ${
                isActive
                  ? `bg-gradient-to-tr ${item.color} text-white shadow-md scale-105`
                  : "bg-slate-100 text-slate-500"
              }`}
            >
              {item.icon}
            </div>
            <span className="text-[10px] sm:text-xs font-child font-bold mt-0.5 tracking-tight truncate max-w-full">
              {item.label}
            </span>
          </button>
        );
      })}
    </nav>
  );
};
