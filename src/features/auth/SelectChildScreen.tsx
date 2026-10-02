import React from "react";
import { Plus, Settings, Star, Sparkles, UserCheck } from "lucide-react";
import { ChildProfile } from "../../types";
import { BimoMascot } from "../../components/BimoMascot";
import { audio } from "../../core/audio";

interface SelectChildScreenProps {
  childrenList: ChildProfile[];
  onSelectChild: (childId: string) => void;
  onAddChild: () => void;
  onOpenParentGate: () => void;
}

export const SelectChildScreen: React.FC<SelectChildScreenProps> = ({
  childrenList,
  onSelectChild,
  onAddChild,
  onOpenParentGate,
}) => {
  return (
    <div className="min-h-screen flex flex-col items-center justify-between p-6 select-none bg-child-pattern">
      {/* Brand Header */}
      <div className="text-center pt-6 animate-in fade-in">
        <div className="flex justify-center mb-3">
          <BimoMascot expression="happy" size="md" />
        </div>
        <h1 className="text-3xl sm:text-4xl font-black text-[#25476A] font-child tracking-wider">
          BINTANG KECIL
        </h1>
        <p className="text-sm sm:text-base font-bold text-sky-700 font-child mt-1">
          Siapa yang mau bermain dan belajar hari ini?
        </p>
      </div>

      {/* Profiles Cards Grid (Reference 1 Bottom Layout Pattern) */}
      <div className="w-full max-w-4xl py-8">
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 justify-center">
          {childrenList.map((child) => (
            <button
              key={child.id}
              onClick={() => {
                audio.playTapSound();
                audio.speak(`Halo ${child.nickname}! Selamat datang kembali!`);
                onSelectChild(child.id);
              }}
              className="group bg-white hover:bg-amber-50/60 p-6 rounded-[32px] border-4 border-sky-200 hover:border-amber-400 shadow-md hover:shadow-2xl transition-all duration-200 flex flex-col items-center text-center cursor-pointer active:scale-95"
            >
              <div className="w-24 h-24 rounded-full bg-gradient-to-tr from-amber-100 to-sky-100 border-3 border-amber-300 flex items-center justify-center text-5xl mb-4 group-hover:scale-110 transition-transform shadow-inner">
                {child.avatar || "🐰"}
              </div>

              <h3 className="text-2xl font-black text-[#25476A] font-child group-hover:text-amber-950">
                {child.nickname}
              </h3>
              <p className="text-xs font-bold text-slate-400 font-child mt-0.5">
                Usia {child.age} Tahun
              </p>

              <div className="mt-4 px-4 py-1.5 bg-amber-100/80 rounded-full border border-amber-300 flex items-center gap-1.5 text-xs font-black text-amber-900 font-child">
                <Star className="w-3.5 h-3.5 fill-amber-500 text-amber-500" />
                <span>{child.stars} Bintang</span>
              </div>
            </button>
          ))}

          {/* "+ Tambah Anak" Card */}
          <button
            onClick={() => {
              audio.playTapSound();
              onAddChild();
            }}
            className="group bg-white/70 hover:bg-white p-6 rounded-[32px] border-4 border-dashed border-sky-300 hover:border-sky-500 shadow-sm hover:shadow-lg transition-all duration-200 flex flex-col items-center justify-center text-center cursor-pointer active:scale-95 min-h-[220px]"
          >
            <div className="w-18 h-18 rounded-full bg-sky-100 text-sky-600 flex items-center justify-center mb-3 group-hover:scale-110 transition-transform">
              <Plus className="w-8 h-8 stroke-[3]" />
            </div>
            <span className="text-lg font-black text-sky-800 font-child">
              + Tambah Anak
            </span>
            <span className="text-xs font-bold text-slate-400 font-child mt-1">
              Buat profil baru
            </span>
          </button>
        </div>
      </div>

      {/* Yellow Pill Button: "Edit Akun / Mode Orang Tua" (Reference 1 Bottom Pattern) */}
      <div className="pb-6 animate-in fade-in">
        <button
          onClick={() => {
            audio.playTapSound();
            onOpenParentGate();
          }}
          className="inline-flex items-center gap-2.5 bg-gradient-to-b from-[#FFE34D] to-[#FFC933] hover:from-[#FFD814] hover:to-[#FFB703] border-3 border-amber-400 px-8 py-3.5 rounded-full font-child font-black text-amber-950 text-base shadow-lg transition-all active:scale-95 hover:shadow-xl"
        >
          <Settings className="w-5 h-5 text-amber-900" />
          <span>Edit Akun / Mode Orang Tua</span>
        </button>
      </div>
    </div>
  );
};
