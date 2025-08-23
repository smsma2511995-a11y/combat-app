// lib/data/diet_data.dart

class DietTip {
  final String title;
  final String description;

  DietTip({required this.title, required this.description});
}

final List<DietTip> dietTips = [
  DietTip(
    title: "الفطار",
    description: "أي بروتين متاح (بيض / فول / جبنة) + رغيف عيش + كوب شاي أو لبن.",
  ),
  DietTip(
    title: "الغداء",
    description: "أي أكل مطبوخ متاح (عدس / مكرونة / رز) + مصدر بروتين لو فيه (بيضة / فول / لحمة).",
  ),
  DietTip(
    title: "العشاء",
    description: "بطاطس مسلوقة أو مهروسة / رغيف + جبنة بيضا أو فول.",
  ),
  DietTip(
    title: "سناك اختياري",
    description: "موزة، أو شوفان بالماء/اللبن لو متاح.",
  ),
  DietTip(
    title: "مياه",
    description: "6–8 أكواب يوميًا للحفاظ على الترطيب والطاقة.",
  ),
  DietTip(
    title: "مبدأ عام",
    description: "كل وجبة لازم يكون فيها (كربوهيدرات + بروتين + دهون بسيطة). الأكل يتغير حسب اللي موجود عندك.",
  ),
];
