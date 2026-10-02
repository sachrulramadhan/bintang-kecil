class AudioService {
  private ctx: AudioContext | null = null;
  private currentUtterance: SpeechSynthesisUtterance | null = null;
  private isSpeaking = false;
  private speechQueue: { text: string; lang: string; onEnd?: () => void }[] = [];

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

  // --- TTS Narration (Web Speech API) ---
  speak(
    text: string,
    options: {
      lang?: "id-ID" | "en-US" | "ar-SA" | "zh-CN";
      rate?: number;
      pitch?: number;
      volume?: number;
      onEnd?: () => void;
      interrupt?: boolean;
    } = {}
  ): void {
    if (typeof window === "undefined" || !("speechSynthesis" in window)) {
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

    const utterance = new SpeechSynthesisUtterance(text);
    utterance.lang = lang;
    utterance.rate = rate;
    utterance.pitch = pitch;
    utterance.volume = volume;

    // Try finding matching voice
    try {
      const voices = window.speechSynthesis.getVoices();
      const matchingVoice = voices.find((v) => v.lang.startsWith(lang.slice(0, 2)));
      if (matchingVoice) {
        utterance.voice = matchingVoice;
      }
    } catch {}

    utterance.onend = () => {
      this.isSpeaking = false;
      this.currentUtterance = null;
      if (onEnd) onEnd();
      this.processNextInQueue();
    };

    utterance.onerror = (e) => {
      // Don't crash on speech error
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
