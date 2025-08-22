import 'package:flutter/material.dart';
import 'training_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fight Training"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Text("ابدأ التمرين", style: TextStyle(fontSize: 20, color: Colors.black)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TrainingScreen()),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'exercises_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fight Training"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Text("قائمة التمارين", style: TextStyle(fontSize: 20, color: Colors.black)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ExercisesScreen()),
            );
          },
        ),
      ),
    );
  }
}
