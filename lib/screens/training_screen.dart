import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TrainingScreen extends StatefulWidget {
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final player = AudioPlayer();
  int currentExercise = 0;
  List<Map<String, dynamic>> exercises = [
    {"name": "تمرين اللكمات", "sound": "002-1.mp3", "duration": 10},
    {"name": "تمرين الركلات", "sound": "001.mp3", "duration": 10},
  ];

  Timer? timer;
  int timeLeft = 0;

  @override
  void initState() {
    super.initState();
    startExercise();
  }

  void startExercise() async {
    if (currentExercise >= exercises.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("💪 خلصت التمرين كله!")),
      );
      return;
    }

    final exercise = exercises[currentExercise];
    timeLeft = exercise["duration"];

    // صوت البداية
    await player.play(AssetSource("sounds/bell_start.mp3"));

    // تشغيل الدليل الصوتي
    await Future.delayed(Duration(seconds: 1));
    await player.play(AssetSource("sounds/${exercise['sound']}"));

    // عداد زمني
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) async {
      setState(() => timeLeft--);

      if (timeLeft <= 0) {
        t.cancel();

        // صوت النهاية
        await player.play(AssetSource("sounds/bell_end.mp3"));

        setState(() => currentExercise++);
        Future.delayed(Duration(seconds: 2), () {
          startExercise();
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentExercise >= exercises.length) {
      return Scaffold(
        appBar: AppBar(title: Text("Training")),
        body: Center(child: Text("🎉 مبروك! خلصت كل التمارين")),
      );
    }

    final exercise = exercises[currentExercise];
    return Scaffold(
      appBar: AppBar(title: Text("Training")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(exercise["name"], style: TextStyle(fontSize: 28, color: Colors.orange)),
            SizedBox(height: 20),
            Text("⏱️ باقي $timeLeft ثانية", style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
