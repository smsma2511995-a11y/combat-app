import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkoutScreen(),
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  final player = AudioPlayer();

  final exercises = [
    {"name": "إحماء", "image": "assets/images/warmup.gif", "sound": "guide-warmup.mp3", "duration": 30},
    {"name": "فتح الحوض", "image": "assets/images/split.gif", "sound": "guide-split.mp3", "duration": 40},
    {"name": "كونغ فو", "image": "assets/images/kungfu.gif", "sound": "guide-kungfu.mp3", "duration": 35},
    {"name": "نينجا", "image": "assets/images/ninja.gif", "sound": "guide-ninja.mp3", "duration": 30},
    {"name": "قتال الشوارع", "image": "assets/images/streetfight.gif", "sound": "guide-street.mp3", "duration": 45},
  ];

  Future<void> startWorkout() async {
    for (var ex in exercises) {
      await player.play(AssetSource("sounds/start-bell.mp3"));
      await Future.delayed(Duration(seconds: 1));

      await player.play(AssetSource("sounds/${ex['sound']}"));
      await Future.delayed(Duration(seconds: ex['duration'] as int));

      await player.play(AssetSource("sounds/end-bell.mp3"));
      await Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          ...exercises.map((ex) => Card(
                child: Column(
                  children: [
                    Image.asset(ex["image"] as String, height: 150),
                    Text(ex["name"] as String, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              )),
          ElevatedButton(
            onPressed: startWorkout,
            child: Text("ابدأ التمرين", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
