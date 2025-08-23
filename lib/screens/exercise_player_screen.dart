// lib/screens/exercise_player_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../services/tts_service.dart';
import '../services/audio_service.dart';
import '../services/settings_service.dart';

class ExercisePlayerScreen extends StatefulWidget {
  const ExercisePlayerScreen({super.key});
  @override
  State<ExercisePlayerScreen> createState() => _ExercisePlayerScreenState();
}

class _ExercisePlayerScreenState extends State<ExercisePlayerScreen> {
  late List<Exercise> list;
  late int index;
  int remaining = 0;
  bool running = false;
  bool inRest = false;
  Timer? _timer;

  int speed = SettingsService().globalSpeed;
  int work = SettingsService().globalWorkSec;
  int rest = SettingsService().globalRestSec;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    list = (args?['filtered'] as List<Exercise>?) ?? [];
    index = (args?['startIndex'] as int?) ?? 0;
    if (list.isEmpty) {
      Navigator.pop(context);
      return;
    }
    _prepare();
  }

  void _prepare() {
    final ex = list[index];
    work = ex.defaultSeconds;
    rest = ex.restSeconds;
    remaining = work;
    inRest = false;
    _announce('جاهز لتمرين: ${ex.nameAr}. السرعة ${speed} من 10. سنبدأ الآن.');
  }

  Future<void> _announce(String text) async {
    if (SettingsService().ttsEnabled) {
      await TtsService().setSpeedFromScale(speed);
      await TtsService().speak(text);
    }
  }

  void _start() async {
    await AudioService().playStartBell();
    _tickStart();
    setState(() => running = true);
  }

  void _tickStart() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!running) return;
      setState(() => remaining--);
      if (remaining <= 0) {
        _segmentDone();
      } else if (remaining == 5) {
        _announce('متبقي خمس ثواني.');
      }
    });
  }

  void _segmentDone() async {
    await AudioService().playEndBell();
    _timer?.cancel();
    if (!inRest && rest > 0) {
      // انتقل لراحة
      setState(() {
        inRest = true;
        remaining = rest;
      });
      _announce('انتهى التمرين. راحة ${rest} ثانية.');
      _tickStart();
    } else {
      // انتهت الراحة أو لا توجد راحة: تمرين جديد
      _next(auto: true);
    }
  }

  void _toggle() {
    setState(() => running = !running);
    if (running) {
      _announce(inRest ? 'استئناف الراحة.' : 'استئناف التمرين.');
    } else {
      _announce('إيقاف مؤقت.');
    }
  }

  void _next({bool auto = false}) {
    _timer?.cancel();
    if (index < list.length - 1) {
      setState(() => index++);
      _prepare();
      if (auto) {
        _start();
      }
    } else {
      _announce('أحسنت! انتهت تمارين اليوم.');
      Navigator.pop(context);
    }
  }

  void _prev() {
    _timer?.cancel();
    if (index > 0) {
      setState(() => index--);
      _prepare();
    }
  }

  void _repeat() {
    _timer?.cancel();
    _prepare();
  }

  @override
  void dispose() {
    _timer?.cancel();
    TtsService().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ex = list[index];
    final phaseColor = inRest ? Colors.green : const Color(0xFFFF6600);

    return Scaffold(
      appBar: AppBar(
        title: Text(inRest ? 'راحة' : ex.nameAr),
        actions: [
          IconButton(icon: const Icon(Icons.info_outline), onPressed: () {
            _announce('شرح سريع: ${ex.descAr}');
            _showDesc(ex);
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(ex.assetPath, fit: BoxFit.contain),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(ex.descAr, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            _timerBar(remaining, inRest ? rest : work, phaseColor),
            const SizedBox(height: 8),
            _controls(),
            const SizedBox(height: 8),
            _speedAndTime(),
          ],
        ),
      ),
    );
  }

  Widget _timerBar(int value, int total, Color c) {
    final p = total == 0 ? 0.0 : value / total;
    return Column(
      children: [
        LinearProgressIndicator(value: p, minHeight: 10, color: c, backgroundColor: Colors.white10),
        const SizedBox(height: 6),
        Text('${inRest ? "راحة" : "تمرين"}: ${value}s / $total s'),
      ],
    );
  }

  Widget _controls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(icon: const Icon(Icons.skip_previous), onPressed: _prev, tooltip: 'السابق'),
        ElevatedButton.icon(
          onPressed: _toggle,
          icon: Icon(running ? Icons.pause : Icons.play_arrow),
          label: Text(running ? 'إيقاف' : 'ابدأ'),
        ),
        IconButton(icon: const Icon(Icons.loop), onPressed: _repeat, tooltip: 'تكرار'),
        IconButton(icon: const Icon(Icons.skip_next), onPressed: _next, tooltip: 'التالي'),
      ],
    );
  }

  Widget _speedAndTime() {
    return Column(
      children: [
        Row(
          children: [
            const Text('السرعة'),
            Expanded(
              child: Slider(
                value: speed.toDouble(),
                min: 1, max: 10, divisions: 9,
                onChanged: (v) {
                  setState(() => speed = v.toInt());
                  TtsService().setSpeedFromScale(speed);
                },
              ),
            ),
            Text('$speed/10'),
          ],
        ),
        Row(
          children: [
            const Text('زمن التمرين (ث)'),
            Expanded(
              child: Slider(
                value: work.toDouble(), min: 10, max: 120, divisions: 22,
                onChanged: (v) => setState(() => work = v.toInt()),
                onChangeEnd: (_) { setState(() => remaining = inRest ? remaining : work); },
              ),
            ),
            Text('$work'),
          ],
        ),
        Row(
          children: [
            const Text('الراحة (ث)'),
            Expanded(
              child: Slider(
                value: rest.toDouble(), min: 0, max: 90, divisions: 18,
                onChanged: (v) => setState(() => rest = v.toInt()),
              ),
            ),
            Text('$rest'),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: List.generate(10, (i) => OutlinedButton(
            onPressed: () {
              setState(() => speed = i+1);
              TtsService().setSpeedFromScale(speed);
              _announce('السرعة ${speed}.');
            },
            child: Text('${i+1}'),
          )),
        )
      ],
    );
  }

  void _showDesc(Exercise ex) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'إرشادات الأمان: حافظ على مسافة آمنة، لا تختبر الدفاع ضد سلاح إلا تحت إشراف مختص وبمعدات حماية. '
          'الغرض تعليمي عام. \n\n${ex.descAr}',
          style: const TextStyle(height: 1.4),
        ),
      ),
    );
  }
}
