import { storage } from "./storage";

class AudioService {
  private ctx: AudioContext | null = null;
  private currentUtterance: SpeechSynthesisUtterance | null = null;
  private currentAudioElement: HTMLAudioElement | null = null;
  private isSpeaking = false;
  private speechQueue: { text: string; lang: string; onEnd?: () => void }[] = [];
  private audioCache = new Map<string, string>(); // Cache blob URLs for generated phrases
  private cachedVoices: SpeechSynthesisVoice[] = [];

  constructor() {
    if (typeof window !== "undefined" && "speechSynthesis" in window) {
      this.cachedVoices = window.speechSynthesis.getVoices();
      window.speechSynthesis.onvoiceschanged = () => {
        this.cachedVoices = window.speechSynthesis.getVoices();
      };
    }
  }

  private getAudioContext(): AudioContext | null {
    if (typeof window === "undefined") return null;
    if (!this.ctx) {
      const AudioCtx = window.AudioContext || (window as any).webkitAudioContext;
      if (AudioCtx) {
        this.ctx = new AudioCtx();
      }
    }
    if (this.ctx && this.ctx.state === "suspended") {
      this.ctx.resume().catch(() => {});
    }
    return this.ctx;
  }

  // --- TTS Narration: ElevenLabs dengan Fallback Web Speech API ---
  async speak(
    text: string,
    options: {
      lang?: "id-ID" | "en-US" | "ar-SA" | "zh-CN";
      rate?: number;
      pitch?: number;
      volume?: number;
      onEnd?: () => void;
      interrupt?: boolean;
    } = {}
  ): Promise<void> {
    if (typeof window === "undefined") {
      options.onEnd?.();
      return;
    }

    const {
      lang = "id-ID",
      rate = 0.85,
      pitch = 1.15,
      volume = 1,
      onEnd,
      interrupt = true,
    } = options;

    if (interrupt) {
      this.stopSpeaking();
    }

    const elevenLabsApiKey =
      storage.getElevenLabsApiKey() ||
      ((import.meta as any).env?.VITE_ELEVENLABS_API_KEY as string | undefined);
    const elevenLabsEnabled = storage.isElevenLabsEnabled();

    // Jika ElevenLabs aktif dan memiliki API Key, coba gunakan ElevenLabs terlebih dahulu
    if (elevenLabsEnabled && elevenLabsApiKey && elevenLabsApiKey.trim() !== "") {
      try {
        const played = await this.speakWithElevenLabs(text, elevenLabsApiKey, options);
        if (played) {
          return;
        }
      } catch (err) {
        console.warn("ElevenLabs TTS gagal, beralih ke suara lokal browser:", err);
      }
    }

    // Fallback: Web Speech API lokal browser
    this.speakWithWebSpeech(text, { lang, rate, pitch, volume, onEnd });
  }

  private async speakWithElevenLabs(
    text: string,
    apiKey: string,
    options: { onEnd?: () => void; volume?: number }
  ): Promise<boolean> {
    const voiceId =
      storage.getElevenLabsVoiceId() ||
      ((import.meta as any).env?.VITE_ELEVENLABS_VOICE_ID as string | undefined) ||
      "21m00Tcm4TlvDq8ikWAM"; // Default Rachel / Friendly child-friendly tone

    const cacheKey = `${voiceId}_${text.trim()}`;
    let audioUrl = this.audioCache.get(cacheKey);

    if (!audioUrl) {
      const response = await fetch(
        `https://api.elevenlabs.io/v1/text-to-speech/${voiceId}`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "xi-api-key": apiKey.trim(),
          },
          body: JSON.stringify({
            text,
            model_id: "eleven_multilingual_v2",
            voice_settings: {
              stability: 0.5,
              similarity_boost: 0.75,
              style: 0.15,
              use_speaker_boost: true,
            },
          }),
        }
      );

      if (!response.ok) {
        throw new Error(`ElevenLabs status ${response.status}: ${response.statusText}`);
      }

      const blob = await response.blob();
      audioUrl = URL.createObjectURL(blob);
      this.audioCache.set(cacheKey, audioUrl);
    }

    const audio = new Audio(audioUrl);
    audio.volume = options.volume ?? 1;
    this.currentAudioElement = audio;
    this.isSpeaking = true;

    audio.onended = () => {
      this.isSpeaking = false;
      this.currentAudioElement = null;
      options.onEnd?.();
      this.processNextInQueue();
    };

    audio.onerror = () => {
      this.isSpeaking = false;
      this.currentAudioElement = null;
      options.onEnd?.();
      this.processNextInQueue();
    };

    await audio.play();
    return true;
  }

  private speakWithWebSpeech(
    text: string,
    options: {
      lang: "id-ID" | "en-US" | "ar-SA" | "zh-CN";
      rate: number;
      pitch: number;
      volume: number;
      onEnd?: () => void;
    }
  ): void {
    if (!("speechSynthesis" in window)) {
      options.onEnd?.();
      return;
    }

    const { lang, rate, pitch, volume, onEnd } = options;
    const utterance = new SpeechSynthesisUtterance(text);
    utterance.lang = lang;
    utterance.rate = rate;
    utterance.pitch = pitch;
    utterance.volume = volume;

    // Prioritaskan suara Indonesia yang terdengar alami
    try {
      const voices = this.cachedVoices.length > 0 ? this.cachedVoices : window.speechSynthesis.getVoices();
      const preferred = voices.find(
        (v) =>
          v.lang.replace("_", "-").toLowerCase() === lang.toLowerCase() &&
          (v.name.includes("Natural") || v.name.includes("Online") || v.name.includes("Google") || v.name.includes("Gadis"))
      ) || voices.find((v) => v.lang.startsWith(lang.slice(0, 2)));

      if (preferred) {
        utterance.voice = preferred;
      }
    } catch {}

    utterance.onend = () => {
      this.isSpeaking = false;
      this.currentUtterance = null;
      if (onEnd) onEnd();
      this.processNextInQueue();
    };

    utterance.onerror = () => {
      this.isSpeaking = false;
      this.currentUtterance = null;
      if (onEnd) onEnd();
      this.processNextInQueue();
    };

    this.currentUtterance = utterance;
    this.isSpeaking = true;
    try {
      window.speechSynthesis.speak(utterance);
    } catch {
      this.isSpeaking = false;
      onEnd?.();
    }
  }

  private processNextInQueue(): void {
    if (this.speechQueue.length > 0) {
      const next = this.speechQueue.shift();
      if (next) {
        this.speak(next.text, {
          lang: next.lang as any,
          onEnd: next.onEnd,
          interrupt: false,
        });
      }
    }
  }

  stopSpeaking(): void {
    if (this.currentAudioElement) {
      try {
        this.currentAudioElement.pause();
        this.currentAudioElement.currentTime = 0;
      } catch {}
      this.currentAudioElement = null;
    }

    if (typeof window !== "undefined" && "speechSynthesis" in window) {
      try {
        window.speechSynthesis.cancel();
      } catch {}
    }
    this.isSpeaking = false;
    this.currentUtterance = null;
    this.speechQueue = [];
  }

  isCurrentlySpeaking(): boolean {
    if (this.currentAudioElement && !this.currentAudioElement.paused) {
      return true;
    }
    if (typeof window !== "undefined" && "speechSynthesis" in window) {
      return window.speechSynthesis.speaking || this.isSpeaking;
    }
    return this.isSpeaking;
  }

  // --- Sound Effects via Web Audio API (Zero external assets needed) ---

  // Cheerful correct chord (C5 - E5 - G5 - C6)
  playCorrectSound(volume = 0.4): void {
    const ctx = this.getAudioContext();
    if (!ctx) return;
    const now = ctx.currentTime;
    const notes = [523.25, 659.25, 783.99, 1046.5]; // C5, E5, G5, C6
    notes.forEach((freq, idx) => {
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();
      osc.type = "sine";
      osc.frequency.setValueAtTime(freq, now + idx * 0.08);

      gain.gain.setValueAtTime(0, now + idx * 0.08);
      gain.gain.linearRampToValueAtTime(volume, now + idx * 0.08 + 0.02);
      gain.gain.exponentialRampToValueAtTime(0.001, now + idx * 0.08 + 0.35);

      osc.connect(gain);
      gain.connect(ctx.destination);
      osc.start(now + idx * 0.08);
      osc.stop(now + idx * 0.08 + 0.4);
    });
  }

  // Soft encouraging bounce (A4 - F4) - comforting, never harsh
  playEncouragementSound(volume = 0.3): void {
    const ctx = this.getAudioContext();
    if (!ctx) return;
    const now = ctx.currentTime;
    const osc = ctx.createOscillator();
    const gain = ctx.createGain();
    osc.type = "triangle";
    osc.frequency.setValueAtTime(440, now);
    osc.frequency.exponentialRampToValueAtTime(349.23, now + 0.25);

    gain.gain.setValueAtTime(0.01, now);
    gain.gain.linearRampToValueAtTime(volume, now + 0.03);
    gain.gain.exponentialRampToValueAtTime(0.001, now + 0.3);

    osc.connect(gain);
    gain.connect(ctx.destination);
    osc.start(now);
    osc.stop(now + 0.35);
  }

  // Twinkling Star sparkle sound
  playStarSound(volume = 0.35): void {
    const ctx = this.getAudioContext();
    if (!ctx) return;
    const now = ctx.currentTime;
    const freqs = [880, 1174.66, 1396.91, 1760];
    freqs.forEach((freq, idx) => {
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();
      osc.type = "sine";
      osc.frequency.setValueAtTime(freq, now + idx * 0.06);

      gain.gain.setValueAtTime(0.01, now + idx * 0.06);
      gain.gain.linearRampToValueAtTime(volume, now + idx * 0.06 + 0.02);
      gain.gain.exponentialRampToValueAtTime(0.0001, now + idx * 0.06 + 0.28);

      osc.connect(gain);
      gain.connect(ctx.destination);
      osc.start(now + idx * 0.06);
      osc.stop(now + idx * 0.06 + 0.3);
    });
  }

  // Soft tap pop
  playTapSound(volume = 0.25): void {
    const ctx = this.getAudioContext();
    if (!ctx) return;
    const now = ctx.currentTime;
    const osc = ctx.createOscillator();
    const gain = ctx.createGain();
    osc.type = "sine";
    osc.frequency.setValueAtTime(600, now);
    osc.frequency.exponentialRampToValueAtTime(200, now + 0.08);

    gain.gain.setValueAtTime(volume, now);
    gain.gain.exponentialRampToValueAtTime(0.001, now + 0.08);

    osc.connect(gain);
    gain.connect(ctx.destination);
    osc.start(now);
    osc.stop(now + 0.09);
  }

  // Fanfare for level completion
  playTrophySound(volume = 0.4): void {
    const ctx = this.getAudioContext();
    if (!ctx) return;
    const now = ctx.currentTime;
    const notes = [
      { f: 523.25, t: 0, d: 0.15 },
      { f: 523.25, t: 0.15, d: 0.15 },
      { f: 523.25, t: 0.3, d: 0.15 },
      { f: 659.25, t: 0.45, d: 0.3 },
      { f: 783.99, t: 0.75, d: 0.2 },
      { f: 1046.5, t: 0.95, d: 0.5 },
    ];

    notes.forEach((n) => {
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();
      osc.type = "triangle";
      osc.frequency.setValueAtTime(n.f, now + n.t);

      gain.gain.setValueAtTime(0, now + n.t);
      gain.gain.linearRampToValueAtTime(volume, now + n.t + 0.02);
      gain.gain.exponentialRampToValueAtTime(0.001, now + n.t + n.d);

      osc.connect(gain);
      gain.connect(ctx.destination);
      osc.start(now + n.t);
      osc.stop(now + n.t + n.d + 0.05);
    });
  }
}

export const audio = new AudioService();
