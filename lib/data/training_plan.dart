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
