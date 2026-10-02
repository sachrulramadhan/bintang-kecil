import React, { useState } from "react";
import { Gift, Star, Sparkles, Check, ShoppingBag, Palette } from "lucide-react";
import { ChildProfile, ShopItem } from "../../types";
import { SHOP_ITEMS } from "../../data/badges";
import { storage } from "../../core/storage";
import { audio } from "../../core/audio";
import { BimoMascot } from "../../components/BimoMascot";
import confetti from "canvas-confetti";

interface ChildRewardsProps {
  child: ChildProfile;
  onProfileUpdated: (updated: ChildProfile) => void;
}

export const ChildRewards: React.FC<ChildRewardsProps> = ({
  child,
  onProfileUpdated,
}) => {
  const [activeTab, setActiveTab] = useState<"shop" | "world">("shop");
  const [selectedWorldArea, setSelectedWorldArea] = useState<string>("home");

  const handleBuyOrEquipItem = (item: ShopItem) => {
    audio.playTapSound();
    const isOwned = child.ownedItems.includes(item.id);

    if (isOwned) {
      // Toggle equip
      const updated = { ...child };
      if (item.category === "hat") {
        updated.equippedHat = updated.equippedHat === item.id ? undefined : item.id;
      } else if (item.category === "glasses") {
        updated.equippedGlasses = updated.equippedGlasses === item.id ? undefined : item.id;
      }
      storage.saveChild(updated);
      onProfileUpdated(updated);
      audio.playCorrectSound();
    } else {
      // Check stars
      if (child.stars >= item.priceStars) {
        const updated: ChildProfile = {
          ...child,
          stars: child.stars - item.priceStars,
          ownedItems: [...child.ownedItems, item.id],
        };
        // Auto equip if hat or glasses
        if (item.category === "hat") updated.equippedHat = item.id;
        if (item.category === "glasses") updated.equippedGlasses = item.id;

        // If decoration, place in world
        if (item.category === "decoration" && item.previewArea) {
          const areaDecos = updated.worldState.decorations[item.previewArea] || [];
          updated.worldState.decorations[item.previewArea] = [...areaDecos, item.id];
        }

        storage.saveChild(updated);
        onProfileUpdated(updated);
        audio.playTrophySound();
        try {
          confetti({ particleCount: 50, spread: 60, origin: { y: 0.6 } });
        } catch {}
        audio.speak(`Selamat! Kamu mendapatkan ${item.title}!`);
      } else {
        audio.playEncouragementSound();
        audio.speak("Kumpulkan lebih banyak bintang lagi ya untuk membeli barang ini!");
      }
    }
  };

  const worldAreas = [
    { id: "home", label: "🏠 Rumah Bimo", desc: "Tempat istirahat nyaman Bimo" },
    { id: "park", label: "🌳 Taman Bermain", desc: "Taman bermain rumput hijau" },
    { id: "library", label: "📚 Perpustakaan", desc: "Ruang baca buku cerita seru" },
    { id: "lab", label: "🔬 Laboratorium", desc: "Ruang eksperimen sains cilik" },
  ];

  return (
    <div className="w-full max-w-5xl mx-auto p-4 sm:p-6 animate-in fade-in select-none">
      {/* Header Banner */}
      <div className="flex flex-col sm:flex-row items-center justify-between gap-4 mb-6 bg-gradient-to-r from-pink-100 via-rose-50 to-amber-100 p-6 rounded-3xl border-3 border-pink-300 shadow-sm">
        <div className="flex items-center gap-4">
          <div className="w-16 h-16 rounded-2xl bg-pink-400 text-white flex items-center justify-center text-3xl shadow-md shrink-0">
            🎁
          </div>
          <div>
            <h2 className="text-2xl sm:text-3xl font-black text-[#25476A] font-child">
              Toko Hadiah & Dunia Bimo!
            </h2>
            <p className="text-sm font-semibold text-rose-900 font-child">
              Tukarkan bintangmu untuk mendandani Bimo dan menghias dunianya!
            </p>
          </div>
        </div>

        {/* Big Star Balance Badge */}
        <div className="flex items-center gap-2.5 bg-white px-5 py-2.5 rounded-2xl border-3 border-amber-400 shadow-md">
          <span className="text-2xl">⭐</span>
          <div>
            <span className="text-xs font-bold text-amber-600 block uppercase font-child">
              Bintang Tersedia
            </span>
            <span className="text-xl font-black text-amber-950 font-child">
              {child.stars} Bintang
            </span>
          </div>
        </div>
      </div>

      {/* Tabs: Toko Aksesori vs Dunia Bimo */}
      <div className="flex justify-center gap-3 mb-6">
        <button
          onClick={() => {
            audio.playTapSound();
            setActiveTab("shop");
          }}
          className={`flex items-center gap-2 px-6 py-3 rounded-2xl font-child font-black text-lg transition-all shadow-sm active:scale-95 ${
            activeTab === "shop"
              ? "bg-amber-400 text-amber-950 border-2 border-amber-500 scale-105 shadow-md"
              : "bg-white hover:bg-amber-50 text-slate-600 border border-slate-200"
          }`}
        >
          <ShoppingBag className="w-5 h-5" />
          <span>Toko Bimo</span>
        </button>
        <button
          onClick={() => {
            audio.playTapSound();
            setActiveTab("world");
          }}
          className={`flex items-center gap-2 px-6 py-3 rounded-2xl font-child font-black text-lg transition-all shadow-sm active:scale-95 ${
            activeTab === "world"
              ? "bg-emerald-400 text-emerald-950 border-2 border-emerald-500 scale-105 shadow-md"
              : "bg-white hover:bg-emerald-50 text-slate-600 border border-slate-200"
          }`}
        >
          <Palette className="w-5 h-5" />
          <span>Dunia Bimo</span>
        </button>
      </div>

      {activeTab === "shop" ? (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {/* Left: Mascot Showcase with Equipped Items */}
          <div className="bg-white rounded-3xl border-4 border-amber-200 p-6 flex flex-col items-center justify-center text-center shadow-lg">
            <span className="text-xs font-bold text-amber-600 uppercase font-child tracking-wider mb-2">
              Pratinjau Karakter Bimo
            </span>
            <div className="my-4">
              <BimoMascot
                expression="happy"
                size="lg"
                hat={child.equippedHat}
                glasses={child.equippedGlasses}
              />
            </div>
            <h4 className="text-xl font-black text-[#25476A] font-child">
              Bimo yang Keren!
            </h4>
            <p className="text-xs text-slate-500 font-child mt-1">
              Sentuh barang yang kamu miliki untuk memasang atau melepasnya dari Bimo.
            </p>
          </div>

          {/* Right: Items Catalog */}
          <div className="md:col-span-2 grid grid-cols-1 sm:grid-cols-2 gap-4">
            {SHOP_ITEMS.map((item) => {
              const isOwned = child.ownedItems.includes(item.id);
              const isEquipped =
                child.equippedHat === item.id || child.equippedGlasses === item.id;
              const canAfford = child.stars >= item.priceStars;

              return (
                <div
                  key={item.id}
                  className="bg-white p-4.5 rounded-3xl border-3 border-sky-100 hover:border-amber-300 shadow-sm flex items-center justify-between gap-3 transition-all"
                >
                  <div className="flex items-center gap-3">
                    <span className="text-4xl p-2 bg-amber-50 rounded-2xl border border-amber-200">
                      {item.icon}
                    </span>
                    <div>
                      <h5 className="font-child font-black text-base text-[#25476A]">
                        {item.title}
                      </h5>
                      <span className="text-xs font-bold text-amber-600 font-child flex items-center gap-1">
                        ⭐ {item.priceStars} Bintang
                      </span>
                    </div>
                  </div>

                  <button
                    onClick={() => handleBuyOrEquipItem(item)}
                    className={`px-4 py-2 rounded-2xl font-child font-bold text-xs shadow-sm transition-all active:scale-95 flex items-center gap-1 ${
                      isEquipped
                        ? "bg-emerald-500 text-white border-2 border-emerald-600"
                        : isOwned
                        ? "bg-amber-100 text-amber-900 border border-amber-300 hover:bg-amber-200"
                        : canAfford
                        ? "bg-gradient-to-r from-amber-400 to-orange-400 text-white font-extrabold shadow-md hover:scale-105"
                        : "bg-slate-100 text-slate-400 cursor-not-allowed"
                    }`}
                  >
                    {isEquipped ? (
                      <>
                        <Check className="w-3.5 h-3.5" />
                        <span>Dipakai</span>
                      </>
                    ) : isOwned ? (
                      <span>Pakai</span>
                    ) : (
                      <span>Beli ⭐</span>
                    )}
                  </button>
                </div>
              );
            })}
          </div>
        </div>
      ) : (
        // Dunia Bimo View
        <div className="bg-white rounded-3xl border-4 border-emerald-200 p-6 shadow-xl">
          {/* Area Selector */}
          <div className="flex items-center gap-2 overflow-x-auto pb-3 mb-6">
            {worldAreas.map((area) => (
              <button
                key={area.id}
                onClick={() => {
                  audio.playTapSound();
                  setSelectedWorldArea(area.id);
                }}
                className={`px-5 py-2.5 rounded-2xl font-child font-bold text-sm shrink-0 transition-all ${
                  selectedWorldArea === area.id
                    ? "bg-emerald-500 text-white shadow-md scale-102"
                    : "bg-slate-100 text-slate-600 hover:bg-emerald-50"
                }`}
              >
                {area.label}
              </button>
            ))}
          </div>

          {/* Area Canvas Visual Display */}
          <div className="w-full h-72 sm:h-84 bg-gradient-to-b from-sky-200 via-sky-100 to-emerald-100 rounded-3xl border-3 border-emerald-300 relative overflow-hidden flex items-end justify-center p-6 shadow-inner">
            {/* Animated clouds */}
            <div className="absolute top-4 left-8 text-4xl opacity-75">☁️</div>
            <div className="absolute top-8 right-12 text-3xl opacity-75">☁️</div>

            {/* Placed Area Decorations */}
            <div className="absolute inset-0 flex items-center justify-around pointer-events-none p-6">
              {child.worldState.decorations[selectedWorldArea]?.map((decId, i) => {
                const decMeta = SHOP_ITEMS.find((s) => s.id === decId);
                return (
                  <div key={i} className="text-5xl sm:text-6xl animate-bounce drop-shadow-md">
                    {decMeta?.icon || "🌻"}
                  </div>
                );
              })}
            </div>

            {/* Bimo standing in world */}
            <div className="z-10 transform scale-110">
              <BimoMascot
                expression="happy"
                size="lg"
                hat={child.equippedHat}
                glasses={child.equippedGlasses}
              />
            </div>
          </div>

          <p className="text-center text-xs font-semibold text-slate-500 font-child mt-4">
            Beli dekorasi di Toko Hadiah untuk menghiasi {selectedWorldArea}!
          </p>
        </div>
      )}
    </div>
  );
};
