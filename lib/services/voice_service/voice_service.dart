import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

enum VoiceLocale { en, fr, rn, sw, rw }

class VoiceService {
  final FlutterTts _tts = FlutterTts();
  final SpeechToText _stt = SpeechToText();

  bool _isListening = false;
  bool get isListening => _isListening;

  Future<void> speak(String text, {VoiceLocale locale = VoiceLocale.rn}) async {
    await _tts.setLanguage(_localeCode(locale));
    await _tts.setSpeechRate(0.45);
    await _tts.speak(text);
  }

  Future<void> stop() async => _tts.stop();

  Future<bool> initialize({VoiceLocale locale = VoiceLocale.fr}) async {
    final available = await _tts.getLanguages;
    final target = _localeCode(locale);
    return available.any((lang) => lang.contains(target));
  }

  Future<void> startListening({
    required void Function(String recognizedText) onResult,
    VoiceLocale locale = VoiceLocale.fr,
    Duration timeout = const Duration(seconds: 8),
  }) async {
    final ready = await _stt.initialize(
      onStatus: (status) => debugPrint('STT status: $status'),
      onError: (error) => debugPrint('STT error: $error'),
    );
    if (!ready) return;

    _isListening = true;
    await _stt.listen(
      localeId: _localeCode(locale),
      onResult: (result) {
        final text = result.recognizedWords;
        if (text.isNotEmpty) onResult(text);
      },
      listenFor: timeout,
      partialResults: true,
    );
    _isListening = false;
  }

  Future<void> stopListening() async => _stt.stop();

  String _localeCode(VoiceLocale locale) {
    switch (locale) {
      case VoiceLocale.en:
        return 'en-US';
      case VoiceLocale.fr:
        return 'fr-FR';
      case VoiceLocale.rn:
        return 'rn-RW'; // fallback code; provider-specific
      case VoiceLocale.sw:
        return 'sw-KE';
      case VoiceLocale.rw:
        return 'rw-RW';
    }
  }
}
