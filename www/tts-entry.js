import { TextToSpeech } from "@capacitor-community/text-to-speech";

window.WordQuizNativeTTS = {
  speak: (options) => TextToSpeech.speak(options),
  stop: () => TextToSpeech.stop(),
  isLanguageSupported: (options) => TextToSpeech.isLanguageSupported(options)
};
