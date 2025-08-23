// lib/services/settings_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static final SettingsService _i = SettingsService._();
  factory SettingsService() => _i;
  SettingsService._();

  int globalSpeed = 5; // 1..10
  int globalWorkSec = 30;
  int globalRestSec = 15;
  bool cartoon2D = false; // نمط كرتون
  bool ttsEnabled = true;

  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    globalSpeed = p.getInt('speed') ?? 5;
    globalWorkSec = p.getInt('work') ?? 30;
    globalRestSec = p.getInt('rest') ?? 15;
    cartoon2D = p.getBool('cartoon2D') ?? false;
    ttsEnabled = p.getBool('tts') ?? true;
  }

  Future<void> save() async {
    final p = await SharedPreferences.getInstance();
    await p.setInt('speed', globalSpeed);
    await p.setInt('work', globalWorkSec);
    await p.setInt('rest', globalRestSec);
    await p.setBool('cartoon2D', cartoon2D);
    await p.setBool('tts', ttsEnabled);
  }
}
