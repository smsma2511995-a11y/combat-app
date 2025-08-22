import 'package:flutter/material.dart';
import 'training_screen.dart';

class ExercisesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {"name": "اللكمات", "file": "002-1.mp3", "duration": 15},
    {"name": "الركلات", "file": "001.mp3", "duration": 20},
    {"name": "فتح الحوض", "file": "stretch.mp3", "duration": 30},
    {"name": "القتال الحر", "file": "fight.mp3", "duration": 25},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("قائمة التمارين")),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final ex = exercises[index];
          return Card(
            child: ListTile(
              title: Text(ex["name"], style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.play_arrow, color: Colors.orange),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TrainingScreen(
                      exercises: [ex], // يبدأ بتمرين واحد
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
