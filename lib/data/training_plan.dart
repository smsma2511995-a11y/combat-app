// lib/data/training_plan.dart

class TrainingDay {
  final String title;
  final List<String> exercises;

  TrainingDay({required this.title, required this.exercises});
}

class TrainingWeek {
  final int weekNumber;
  final List<TrainingDay> days;

  TrainingWeek({required this.weekNumber, required this.days});
}

class TrainingMonth {
  final int monthNumber;
  final List<TrainingWeek> weeks;

  TrainingMonth({required this.monthNumber, required this.weeks});
}

// الخطة ٣ شهور
final List<TrainingMonth> trainingPlan = [
  // ===== الشهر الأول =====
  TrainingMonth(
    monthNumber: 1,
    weeks: List.generate(4, (week) => TrainingWeek(
      weekNumber: week + 1,
      days: [
        TrainingDay(title: "اليوم 1: كاراتيه", exercises: [
          "ركلات أمامية",
          "لكمات مستقيمة",
          "موقف الحصان"
        ]),
        TrainingDay(title: "اليوم 2: مرونة وفتح الحوض", exercises: [
          "تمارين فتح الحوض الجانبي",
          "تمدد أمامي",
          "يوغا بسيطة"
        ]),
        TrainingDay(title: "اليوم 3: وينج تشون", exercises: [
          "Bong Sau",
          "Tan Sau",
          "Punch Chain"
        ]),
        TrainingDay(title: "اليوم 4: راحة أو جري", exercises: [
          "جري خفيف 15 دقيقة",
          "تمدد شامل"
        ]),
        TrainingDay(title: "اليوم 5: جودو + نزع سلاح", exercises: [
          "Osoto Gari (رمي خارجي)",
          "Kesa Gatame (تثبيت)",
          "نزع سكين أمامي"
        ]),
        TrainingDay(title: "اليوم 6: قوة ولياقة", exercises: [
          "Push Ups x20",
          "Squats x20",
          "Plank 30s"
        ]),
        TrainingDay(title: "اليوم 7: راحة", exercises: ["استرخاء ونوم جيد"]),
      ],
    )),
  ),

  // ===== الشهر الثاني =====
  TrainingMonth(
    monthNumber: 2,
    weeks: List.generate(4, (week) => TrainingWeek(
      weekNumber: week + 1,
      days: [
        TrainingDay(title: "اليوم 1: تايكوندو", exercises: [
          "ركلة دائرية Mawashi Geri",
          "ركلة دوران خلفية",
          "تدريب سرعة"
        ]),
        TrainingDay(title: "اليوم 2: مرونة", exercises: [
          "تمارين فتح الحوض كامل",
          "Stretch للظهر",
          "يوغا 15 دقيقة"
        ]),
        TrainingDay(title: "اليوم 3: كونغ فو (حيوانات)", exercises: [
          "موقف الحصان",
          "حركة النمر",
          "حركة الكركي"
        ]),
        TrainingDay(title: "اليوم 4: راحة نشطة", exercises: [
          "مشي 30 دقيقة",
          "تنفس عميق"
        ]),
        TrainingDay(title: "اليوم 5: جيوجتسو", exercises: [
          "Armbar",
          "Triangle Choke",
          "Sweep بسيط"
        ]),
        TrainingDay(title: "اليوم 6: قتال الشارع + هيبة", exercises: [
          "صد الضربة المباشرة",
          "الخروج من إمساك",
          "تدريب الثقة بالنفس"
        ]),
        TrainingDay(title: "اليوم 7: راحة", exercises: ["شاي/تأمل"]),
      ],
    )),
  ),

  // ===== الشهر الثالث =====
  TrainingMonth(
    monthNumber: 3,
    weeks: List.generate(4, (week) => TrainingWeek(
      weekNumber: week + 1,
      days: [
        TrainingDay(title: "اليوم 1: كاراتيه + وينج تشون", exercises: [
          "لكمات + Bong Sau",
          "دمج دفاع وهجوم",
        ]),
        TrainingDay(title: "اليوم 2: مرونة + قوة", exercises: [
          "فتح حوض",
          "Push Ups x30",
          "Plank دقيقة"
        ]),
        TrainingDay(title: "اليوم 3: جودو + جيوجتسو", exercises: [
          "Osoto Gari",
          "Armbar",
          "خروج من تثبيت"
        ]),
        TrainingDay(title: "اليوم 4: راحة", exercises: ["تمارين تنفس"]),
        TrainingDay(title: "اليوم 5: كونغ فو + نينجا", exercises: [
          "حركة التنين",
          "قفزات نينجا",
          "تسلق أو توازن"
        ]),
        TrainingDay(title: "اليوم 6: قتال الشارع + هيبة", exercises: [
          "سيناريو مواجهة",
          "رد فعل سريع",
          "تمرين نظرات الهيبة"
        ]),
        TrainingDay(title: "اليوم 7: راحة ومراجعة", exercises: [
          "مراجعة كل التمارين",
          "تأمل"
        ]),
      ],
    )),
  ),
];
// lib/data/training_plan.dart

class Exercise {
  final String name;
  final String description;
  final String category; // كاراتيه، كونغ فو، إلخ

  Exercise({
    required this.name,
    required this.description,
    required this.category,
  });
}

class TrainingDay {
  final String title;
  final List<Exercise> exercises;

  TrainingDay({required this.title, required this.exercises});
}

class TrainingWeek {
  final String title;
  final List<TrainingDay> days;

  TrainingWeek({required this.title, required this.days});
}

class TrainingMonth {
  final String title;
  final List<TrainingWeek> weeks;

  TrainingMonth({required this.title, required this.weeks});
}

/// 📋 خطة تدريب كاملة 3 شهور كمثال
final List<TrainingMonth> trainingPlan = [
  TrainingMonth(
    title: "الشهر الأول - الأساسيات",
    weeks: [
      TrainingWeek(
        title: "الأسبوع الأول",
        days: [
          TrainingDay(
            title: "اليوم 1",
            exercises: [
              Exercise(
                name: "Bong Sau",
                description: "حركة دفاع أساسية ضد اللكمة المباشرة.",
                category: "Wing Chun",
              ),
              Exercise(
                name: "ركلة أمامية",
                description: "ركلة أساسية لتقوية الرجل وزيادة التوازن.",
                category: "Karate",
              ),
              Exercise(
                name: "فتح الحوض",
                description: "تمرين لزيادة المرونة وتهيئة الجسم للركلات العالية.",
                category: "مرونة",
              ),
            ],
          ),
          TrainingDay(
            title: "اليوم 2",
            exercises: [
              Exercise(
                name: "Osoto Gari",
                description: "رمي خارجي أساسي في الجودو.",
                category: "Judo",
              ),
              Exercise(
                name: "قفز الحبل",
                description: "تمرين كارديو لتحسين اللياقة والسرعة.",
                category: "لياقة",
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  TrainingMonth(
    title: "الشهر الثاني - تطوير القوة",
    weeks: [
      TrainingWeek(
        title: "الأسبوع الأول",
        days: [
          TrainingDay(
            title: "اليوم 1",
            exercises: [
              Exercise(
                name: "ركلة دائرية",
                description: "ركلة قوية تُستخدم في الكاراتيه والتايكوندو.",
                category: "Karate",
              ),
              Exercise(
                name: "صد علوي",
                description: "صد اللكمات الموجهة للرأس.",
                category: "Taekwondo",
              ),
              Exercise(
                name: "تمرين الضغط",
                description: "زيادة قوة الذراعين والصدر.",
                category: "لياقة",
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  TrainingMonth(
    title: "الشهر الثالث - القتال التطبيقي",
    weeks: [
      TrainingWeek(
        title: "الأسبوع الأول",
        days: [
          TrainingDay(
            title: "اليوم 1",
            exercises: [
              Exercise(
                name: "قتال الشوارع (محاكاة)",
                description: "تدريب على الدفاع ضد أكثر من خصم.",
                category: "Street Fight",
              ),
              Exercise(
                name: "نزع السلاح (سكين وهمي)",
                description: "تقنية دفاعية ضد الهجوم بالسكين.",
                category: "Self Defense",
              ),
              Exercise(
                name: "تمرين الجلوس (Squat)",
                description: "تقوية الأرجل وتحمل الجسم.",
                category: "لياقة",
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
