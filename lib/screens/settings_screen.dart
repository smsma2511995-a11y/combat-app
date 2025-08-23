// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import '../services/settings_service.dart';
import '../services/tts_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final s = SettingsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: FutureBuilder(
        future: s.load(),
        builder: (_, __) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SwitchListTile(
                title: const Text('تشغيل الدليل الصوتي (TTS)'),
                value: s.ttsEnabled,
                onChanged: (v) async {
                  setState(() => s.ttsEnabled = v);
                  await s.save();
                  if (v) TtsService().speak('تم تشغيل الدليل الصوتي.');
                },
              ),
              const Divider(),
              _slider('السرعة العامة', s.globalSpeed, 1, 10, (v) async {
                setState(() => s.globalSpeed = v);
                await s.save();
                TtsService().setSpeedFromScale(s.globalSpeed);
              }),
              _slider('زمن التمرين العام (ث)', s.globalWorkSec, 10, 120, (v) async {
                setState(() => s.globalWorkSec = v);
                await s.save();
              }),
              _slider('زمن الراحة العام (ث)', s.globalRestSec, 0, 90, (v) async {
                setState(() => s.globalRestSec = v);
                await s.save();
              }),
              const Divider(),
              SwitchListTile(
                title: const Text('وضع كارتون 2D (تجريبي)'),
                subtitle: const Text('تفعيل أشكال مسطحة مبسطة عند توفرها'),
                value: s.cartoon2D,
                onChanged: (v) async {
                  setState(() => s.cartoon2D = v);
                  await s.save();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _slider(String label, int value, int min, int max, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $value'),
        Slider(
          value: value.toDouble(),
          min: min.toDouble(), max: max.toDouble(), divisions: (max-min),
          onChanged: (v) => onChanged(v.toInt()),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
