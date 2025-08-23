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
// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../data/exercises.dart';
import '../models/exercise.dart';
import '../widgets/side_drawer.dart';
import '../widgets/exercise_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Style? filter;

  @override
  Widget build(BuildContext context) {
    final list = filter == null ? allExercises : allExercises.where((e) => e.style == filter).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('التمارين اليومية')),
      drawer: const SideDrawer(),
      body: Column(
        children: [
          _filters(),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, i) => ExerciseCard(
                ex: list[i],
                onStart: () => Navigator.pushNamed(context, '/player', arguments: {
                  'startIndex': i,
                  'filtered': list,
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filters() {
    return SizedBox(
      height: 56,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          _chip(null, 'الكل'),
          _chip(Style.wingChun, 'وينج تشون'),
          _chip(Style.karate, 'كاراتيه'),
          _chip(Style.taekwondo, 'تايكوندو'),
          _chip(Style.judo, 'جودو'),
          _chip(Style.bjj, 'جيوجيتسو'),
          _chip(Style.ninja, 'نينجا'),
          _chip(Style.street, 'الشارع'),
          _chip(Style.strength, 'قوة'),
          _chip(Style.flexibility, 'مرونة'),
          _chip(Style.weapons, 'أسلحة'),
        ],
      ),
    );
  }

  Widget _chip(Style? s, String label) {
    final active = filter == s;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        selected: active,
        label: Text(label),
        onSelected: (_) => setState(() => filter = s),
      ),
    );
  }
}
