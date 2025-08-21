import 'package:flutter/material.dart';

void main() {
  runApp(FightTrainingApp());
}

class FightTrainingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fight Training',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {"title": "Karate", "image": "assets/images/karate.gif"},
    {"title": "Kung Fu", "image": "assets/images/kungfu.gif"},
    {"title": "Stretching", "image": "assets/images/stretching.gif"},
    {"title": "Ninja Moves", "image": "assets/images/ninja.gif"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Martial Arts Training")),
      body: ListView(
        children: [
          ...exercises.map((exercise) => Card(
                child: ListTile(
                  leading: Image.asset(exercise["image"]!, width: 60, height: 60),
                  title: Text(exercise["title"]!),
                ),
