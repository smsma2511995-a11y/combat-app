// lib/services/tts_service.dart
import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  static final TtsService _i = TtsService._();
  factory TtsService() => _i;
  TtsService._();

  final FlutterTts _tts = FlutterTts();
  double _rate = 0.5; // 0.1..1.0
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    await _tts.setLanguage('ar-SA'); // عربي سعودي واضح
    await _tts.setSpeechRate(_rate);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    _initialized = true;
  }

  Future<void> setSpeedFromScale(int speed1to10) async {
    // تحويل 1..10 إلى 0.2..1.0
    _rate = 0.1 + (speed1to10.clamp(1,10)-1) * (0.9/9);
    await _tts.setSpeechRate(_rate);
  }

  Future<void> speak(String text) async {
    await init();
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> stop() async => _tts.stop();
}
