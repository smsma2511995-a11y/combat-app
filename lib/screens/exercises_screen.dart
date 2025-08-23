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
// lib/screens/exercises_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/exercises_data.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("ar-SA"); // اللغة: عربي سعودي (ممكن تخليها en-US لو عاوز إنجليزي)
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.9);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercises"),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة التمرين
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    exercise.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        exercise.description,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exercise.category,
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.blueGrey,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.volume_up, color: Colors.blue),
                            onPressed: () {
                              _speak("${exercise.name}: ${exercise.description}");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
         );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/exercises_data.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String selectedCategory = "All";

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("ar-SA");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.9);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    // جلب كل الفئات (categories)
    final categories = ["All", ...{
      for (var e in exercises) e.category
    }];

    // فلترة التمارين
    final filteredExercises = selectedCategory == "All"
        ? exercises
        : exercises.where((e) => e.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercises"),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          // Dropdown لاختيار الفئة
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              items: categories.map((cat) {
                return DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
          ),

          // عرض التمارين
          Expanded(
            child: ListView.builder(
              itemCount: filteredExercises.length,
              itemBuilder: (context, index) {
                final exercise = filteredExercises[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // صورة التمرين
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          exercise.imagePath,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise.name,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              exercise.description,
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  exercise.category,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.volume_up, color: Colors.blue),
                                  onPressed: () {
                                    _speak("${exercise.name}: ${exercise.description}");
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// lib/screens/exercises_screen.dart
import 'package:flutter/material.dart';
import '../data/training_plan.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Training Plan"),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: trainingPlan.length,
        itemBuilder: (context, monthIndex) {
          final month = trainingPlan[monthIndex];
          return ExpansionTile(
            title: Text("Month ${month.monthNumber}",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            children: month.weeks.map((week) {
              return ExpansionTile(
                title: Text("Week ${week.weekNumber}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                children: week.days.map((day) {
                  return ListTile(
                    title: Text(day.title,
                        style: const TextStyle(fontSize: 15)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DayExercisesScreen(day: day),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

// شاشة تعرض التمارين اليومية
class DayExercisesScreen extends StatelessWidget {
  final TrainingDay day;

  const DayExercisesScreen({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(day.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: day.exercises.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.fitness_center, color: Colors.blue),
              title: Text(day.exercises[index]),
            ),
          );
        },
      ),
    );
  }
}
// lib/screens/exercises_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/training_plan.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Training Plan"),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: trainingPlan.length,
        itemBuilder: (context, monthIndex) {
          final month = trainingPlan[monthIndex];
          return ExpansionTile(
            title: Text("Month ${month.monthNumber}",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            children: month.weeks.map((week) {
              return ExpansionTile(
                title: Text("Week ${week.weekNumber}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                children: week.days.map((day) {
                  return ListTile(
                    title: Text(day.title,
                        style: const TextStyle(fontSize: 15)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DayExercisesScreen(day: day),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class DayExercisesScreen extends StatefulWidget {
  final TrainingDay day;

  const DayExercisesScreen({super.key, required this.day});

  @override
  State<DayExercisesScreen> createState() => _DayExercisesScreenState();
}

class _DayExercisesScreenState extends State<DayExercisesScreen> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("ar-SA"); // اللغة: عربي سعودي
    await flutterTts.setPitch(1.0);        // طبقة الصوت
    await flutterTts.speak(text);          // ينطق النص
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.day.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: widget.day.exercises.length,
        itemBuilder: (context, index) {
          final exercise = widget.day.exercises[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.fitness_center, color: Colors.blue),
              title: Text(exercise),
              trailing: IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.green),
                onPressed: () => _speak(exercise),
              ),
            ),
          );
        },
      ),
    );
  }
}
// lib/screens/exercises_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/training_plan.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("خطة التدريب"),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: trainingPlan.length,
        itemBuilder: (context, monthIndex) {
          final month = trainingPlan[monthIndex];
          return ExpansionTile(
            title: Text("الشهر ${month.monthNumber}",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            children: month.weeks.map((week) {
              return ExpansionTile(
                title: Text("الأسبوع ${week.weekNumber}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                children: week.days.map((day) {
                  return ListTile(
                    title: Text(day.title,
                        style: const TextStyle(fontSize: 15)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DayExercisesScreen(day: day),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class DayExercisesScreen extends StatefulWidget {
  final TrainingDay day;

  const DayExercisesScreen({super.key, required this.day});

  @override
  State<DayExercisesScreen> createState() => _DayExercisesScreenState();
}

class _DayExercisesScreenState extends State<DayExercisesScreen> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String name, String description) async {
    await flutterTts.setLanguage("ar-SA"); // لغة عربية
    await flutterTts.setPitch(1.0);        // طبقة الصوت
    await flutterTts.setSpeechRate(0.9);   // سرعة القراءة
    await flutterTts.speak("التمرين: $name. الشرح: $description");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.day.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: widget.day.exercises.length,
        itemBuilder: (context, index) {
          final exercise = widget.day.exercises[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.fitness_center, color: Colors.blue),
              title: Text(exercise.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(exercise.description),
              trailing: IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.green),
                onPressed: () =>
                    _speak(exercise.name, exercise.description),
              ),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/exercises_data.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("ar-SA"); // عربي
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تمارين الفنون القتالية"),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة التمرين
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    exercise.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // الاسم
                      Text(
                        exercise.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // الوصف
                      Text(
                        exercise.description,
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 8),

                      // زر الصوت
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.volume_up, color: Colors.blue, size: 28),
                          onPressed: () {
                            _speak("${exercise.name}: ${exercise.description}");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// lib/data/exercises_data.dart

class Exercise {
  final String name;        // اسم التمرين
  final String description; // وصف التمرين
  final String imagePath;   // مسار الصورة/GIF
  final String category;    // نوع الفن القتالي (كاراتيه - جودو - ...)

  Exercise({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.category,
  });
}

final List<Exercise> exercises = [
  // 🥋 كاراتيه
  Exercise(
    name: "Mawashi Geri",
    description: "ركلة دائرية قوية تستخدم لإبعاد الخصم.",
    imagePath: "assets/images/karate/mawashi_geri.gif",
    category: "كاراتيه",
  ),
  Exercise(
    name: "Oi Zuki",
    description: "لكمة مستقيمة للأمام بخطوة ثابتة.",
    imagePath: "assets/images/karate/oi_zuki.gif",
    category: "كاراتيه",
  ),

  // 👐 وينج تشون
  Exercise(
    name: "Bong Sau",
    description: "حركة دفاع أساسية ضد الضربات المباشرة.",
    imagePath: "assets/images/wingchun/bong_sau.gif",
    category: "وينج تشون",
  ),
  Exercise(
    name: "Pak Sau",
    description: "صد سريع باستخدام الكف لإبعاد يد الخصم.",
    imagePath: "assets/images/wingchun/pak_sau.gif",
    category: "وينج تشون",
  ),

  // 🥋 جودو
  Exercise(
    name: "Osoto Gari",
    description: "رمي خارجي يعتمد على جذب الخصم للخلف.",
    imagePath: "assets/images/judo/osoto_gari.gif",
    category: "جودو",
  ),
  Exercise(
    name: "Seoi Nage",
    description: "رمي الكتف المشهور في الجودو.",
    imagePath: "assets/images/judo/seoi_nage.gif",
    category: "جودو",
  ),

  // 🥋 جيوجيتسو
  Exercise(
    name: "Armbar",
    description: "قفل الذراع للسيطرة على الخصم.",
    imagePath: "assets/images/jiujitsu/armbar.gif",
    category: "جيوجيتسو",
  ),
  Exercise(
    name: "Rear Naked Choke",
    description: "خنق من الخلف لإنهاء القتال.",
    imagePath: "assets/images/jiujitsu/rear_naked_choke.gif",
    category: "جيوجيتسو",
  ),

  // 🐉 كونغ فو
  Exercise(
    name: "Horse Stance",
    description: "وضعية الحصان لتقوية الساقين والثبات.",
    imagePath: "assets/images/kungfu/horse_stance.gif",
    category: "كونغ فو",
  ),
  Exercise(
    name: "Tiger Claw",
    description: "ضربة بمخالب النمر لتشتيت الخصم.",
    imagePath: "assets/images/kungfu/tiger_claw.gif",
    category: "كونغ فو",
  ),

  // ⚔️ نينجا
  Exercise(
    name: "Silent Step",
    description: "خطوة صامتة للتحرك بدون صوت.",
    imagePath: "assets/images/ninja/silent_step.gif",
    category: "نينجا",
  ),
  Exercise(
    name: "Disarm Move",
    description: "تقنية نزع السلاح من يد الخصم.",
    imagePath: "assets/images/ninja/disarm_move.gif",
    category: "نينجا",
  ),

  // 🤸‍♂️ مرونة / فتح الحوض
  Exercise(
    name: "Side Split",
    description: "تمرين فتح الحوض الجانبي.",
    imagePath: "assets/images/flexibility/side_split.gif",
    category: "مرونة",
  ),
  Exercise(
    name: "Forward Bend",
    description: "تمرين إطالة للأمام لزيادة المرونة.",
    imagePath: "assets/images/flexibility/forward_bend.gif",
    category: "مرونة",
  ),

  // 🥊 قتال الشوارع
  Exercise(
    name: "Palm Strike",
    description: "ضربة بالكف مباشرة للوجه أو الذقن.",
    imagePath: "assets/images/street/palm_strike.gif",
    category: "قتال الشوارع",
  ),
  Exercise(
    name: "Knee Strike",
    description: "ضربة ركبة سريعة إلى البطن أو الوجه.",
    imagePath: "assets/images/street/knee_strike.gif",
    category: "قتال الشوارع",
  ),
];
