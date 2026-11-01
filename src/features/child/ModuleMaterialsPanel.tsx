import React, { useEffect, useState } from "react";
import { BookOpen, Volume2 } from "lucide-react";
import { audio } from "../../core/audio";

interface CurriculumMaterial {
  id: string;
  title: string;
  slug: string;
  summary: string;
  lessonTitle: string;
  skills: string[];
  difficulty: string;
}

interface CurriculumModule {
  id: string;
  title: string;
  materials: CurriculumMaterial[];
}

interface ModuleMaterialsPanelProps {
  moduleId: string;
  category: string;
}

/** Cache per kategori supaya panel tidak memanggil API setiap kali modul dibuka. */
const curriculumCache = new Map<string, CurriculumModule[]>();

export const ModuleMaterialsPanel: React.FC<ModuleMaterialsPanelProps> = ({
  moduleId,
  category,
}) => {
  const [materials, setMaterials] = useState<CurriculumMaterial[]>([]);
  const [status, setStatus] = useState<"loading" | "ready" | "error">("loading");

  useEffect(() => {
    let active = true;
    const applyMaterials = (modules: CurriculumModule[]) => {
      const found = modules.find((item) => item.id === moduleId);
      if (active) {
        setMaterials(found?.materials || []);
        setStatus("ready");
      }
    };

    const cached = curriculumCache.get(category);
    if (cached) {
      applyMaterials(cached);
      return () => {
        active = false;
      };
    }

    const load = async () => {
      try {
        const response = await fetch(
          `/api/app/curriculum?category=${encodeURIComponent(category)}`,
          { credentials: "same-origin" },
        );
        if (!response.ok) throw new Error("Materi belum dapat dimuat.");
        const data = (await response.json()) as { modules: CurriculumModule[] };
        curriculumCache.set(category, data.modules || []);
        applyMaterials(data.modules || []);
      } catch {
        if (active) setStatus("error");
      }
    };
    void load();

    return () => {
      active = false;
    };
  }, [category, moduleId]);

  if (status === "error") return null;
  if (status === "loading") {
    return (
      <p className="mt-6 text-sm font-child font-bold text-slate-400">
        Memuat materi dari CMS...
      </p>
    );
  }
  if (materials.length === 0) return null;

  return (
    <div className="mt-8 w-full max-w-xl text-left">
      <div className="mb-3 flex items-center justify-center gap-2 text-amber-900">
        <BookOpen className="h-5 w-5" />
        <span className="font-child text-sm font-black uppercase tracking-wide">
          {materials.length} materi dari CMS
        </span>
      </div>
      <div className="space-y-2">
        {materials.map((material) => (
          <button
            key={material.id}
            onClick={() => {
              audio.playTapSound();
              audio.speak(material.title, { lang: "id-ID", rate: 0.85 });
            }}
            className="flex w-full items-center gap-3 rounded-2xl border-2 border-amber-200 bg-amber-50/70 px-4 py-3 text-left transition-transform active:scale-95 hover:border-amber-400"
          >
            <Volume2 className="h-4 w-4 shrink-0 text-amber-700" />
            <span className="flex-1 font-child text-sm font-bold text-[#25476A]">
              {material.title}
            </span>
          </button>
        ))}
      </div>
    </div>
  );
};
