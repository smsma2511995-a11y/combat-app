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
import 'package:flutter/material.dart';
import 'exercises_screen.dart';
import 'diet_screen.dart';
// تقدر تضيف شاشات جديدة زي flexibility_screen.dart, ninja_screen.dart وهكذا

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fight Training App"),
        backgroundColor: Colors.black87,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          // زر التمارين
          _buildHomeCard(
            context,
            title: "التمارين",
            icon: Icons.fitness_center,
            color: Colors.red,
            screen: const ExercisesScreen(),
          ),

          // زر التغذية
          _buildHomeCard(
            context,
            title: "التغذية",
            icon: Icons.restaurant,
            color: Colors.green,
            screen: const DietScreen(),
          ),

          // زر المرونة
          _buildHomeCard(
            context,
            title: "المرونة",
            icon: Icons.accessibility_new,
            color: Colors.blue,
            screen: const ExercisesScreen(), // مؤقتًا نفس شاشة التمارين
          ),

          // زر النينجا / الدفاع
          _buildHomeCard(
            context,
            title: "النينجا",
            icon: Icons.sports_martial_arts,
            color: Colors.purple,
            screen: const ExercisesScreen(), // مؤقتًا نفس شاشة التمارين
          ),
        ],
      ),
    );
  }

  Widget _buildHomeCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget screen}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        color: color.withOpacity(0.9),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
