import { LearningModule } from "../../types";
import { MODULES_2_3 } from "./modules-2-3";
import { MODULES_4_5 } from "./modules-4-5";
import { MODULES_6_7 } from "./modules-6-7";
import { MODULES_8_12 } from "./modules-8-12";
import { SOCIAL_ARABIC_MANDARIN_MODULES } from "./modules-social-arabic-mandarin";

export const ALL_MODULES: LearningModule[] = [
  ...MODULES_2_3,
  ...MODULES_4_5,
  ...MODULES_6_7,
  ...MODULES_8_12,
  ...SOCIAL_ARABIC_MANDARIN_MODULES,
];

export { MODULES_2_3 } from "./modules-2-3";
export { MODULES_4_5 } from "./modules-4-5";
export { MODULES_6_7 } from "./modules-6-7";
export { MODULES_8_12 } from "./modules-8-12";
export { SOCIAL_ARABIC_MANDARIN_MODULES } from "./modules-social-arabic-mandarin";
