// lib/models/exercise.dart
enum Level { beginner, intermediate, advanced }
enum Style {
  wingChun, karate, taekwondo, judo, bjj, kungfu, ninja, street, strength, flexibility, weapons
}

class Exercise {
  final String id;
  final String nameAr;
  final String descAr;
  final String assetPath; // GIF/PNG
  final Style style;
  final Level level;
  final int defaultSeconds; // مدة التمرين الافتراضية
  final int restSeconds;    // راحة افتراضية
  final bool twoOpponents;  // عرض خصمين

  Exercise({
    required this.id,
    required this.nameAr,
    required this.descAr,
    required this.assetPath,
    required this.style,
    required this.level,
    this.defaultSeconds = 30,
    this.restSeconds = 15,
    this.twoOpponents = true,
  });
}
