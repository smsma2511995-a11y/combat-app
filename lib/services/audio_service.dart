// lib/services/audio_service.dart
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _i = AudioService._();
  factory AudioService() => _i;
  AudioService._();

  final AudioPlayer _bell = AudioPlayer();

  Future<void> playStartBell() async {
    await _bell.stop();
    await _bell.play(AssetSource('assets/sounds/bell_start.mp3'));
  }

  Future<void> playEndBell() async {
    await _bell.stop();
    await _bell.play(AssetSource('assets/sounds/bell_end.mp3'));
  }
}
