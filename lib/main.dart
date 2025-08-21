# combat-app
  import 'package:flutter/material.dart';

void main() {
  runApp(CombatTrainingApp());
}

class CombatTrainingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تدريب القتال',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> weeks = [
    "الأسبوع 1",
    "الأسبوع 2",
    "الأسبوع 3",
    "الأسبوع 4",
    "الأسبوع 5",
    "الأسبوع 6",
    "الأسبوع 7",
    "الأسبوع 8",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("خطة التدريب")),
      body: ListView.builder(
        itemCount: weeks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(weeks[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeekPage(weekNumber: index + 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WeekPage extends StatelessWidget {
  final int weekNumber;
  WeekPage({required this.weekNumber});

  // هنا كل أسبوع ليه تمارين خاصة
  List<Map<String, String>> getExercisesForWeek(int week) {
    switch (week) {
      case 1:
        return [
          {"name": "إحماء عام", "image": "assets/warmup.gif", "desc": "حركات خفيفة لتحضير الجسم"},
          {"name": "لكمة مستقيمة", "image": "assets/punch.gif", "desc": "لكمة سريعة باليد الأمامية"},
          {"name": "ركلة أمامية", "image": "assets/kick.gif", "desc": "ركلة بسيطة للأمام"},
          {"name": "دفاع جانبي", "image": "assets/defense.gif", "desc": "صد الهجوم من الجانب"},
        ];
      case 2:
        return [
          {"name": "إطالات", "image": "assets/stretch.gif", "desc": "إطالات لتحسين المرونة"},
          {"name": "لكمة مزدوجة", "image": "assets/double_punch.gif", "desc": "لكمتين متتاليتين"},
          {"name": "ركلة دائرية", "image": "assets/roundhouse.gif", "desc": "ركلة قوية جانبية"},
          {"name": "صد سكين", "image": "assets/weapon_block.gif", "desc": "التصدي لهجوم بالسكين"},
        ];
      // هنا نكمل باقي الأسابيع بنفس الفكرة
      default:
        return [
          {"name": "تمرين عام", "image": "assets/default.gif", "desc": "تمرين متنوع"},
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final exercises = getExercisesForWeek(weekNumber);
    return Scaffold(
      appBar: AppBar(title: Text("تمارين الأسبوع $weekNumber")),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Card(
            child: ListTile(
              leading: Image.asset(exercise["image"]!, width: 50, height: 50),
              title: Text(exercise["name"]!),
              subtitle: Text(exercise["desc"]!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailPage(exercise: exercise),
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

class ExerciseDetailPage extends StatelessWidget {
  final Map<String, String> exercise;
  ExerciseDetailPage({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercise["name"]!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(exercise["image"]!, height: 250),
            SizedBox(height: 20),
            Text(
              exercise["desc"]!,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
