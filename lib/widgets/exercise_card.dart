// lib/widgets/exercise_card.dart
import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise ex;
  final VoidCallback onStart;
  const ExerciseCard({super.key, required this.ex, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1a1a1a),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: onStart,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(
                width: 90, height: 90,
                child: Image.asset(ex.assetPath, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ex.nameAr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFF6600))),
                    const SizedBox(height: 6),
                    Text(ex.descAr, maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Chip(label: Text(_styleLabel(ex.style))),
                        const SizedBox(width: 8),
                        Chip(label: Text(_levelLabel(ex.level))),
                      ],
                    )
                  ],
                ),
              ),
              IconButton(icon: const Icon(Icons.play_arrow), onPressed: onStart)
            ],
          ),
        ),
      ),
    );
  }

  String _styleLabel(Style s) {
    switch (s) {
      case Style.wingChun: return 'وينج تشون';
      case Style.karate: return 'كاراتيه';
      case Style.taekwondo: return 'تايكوندو';
      case Style.judo: return 'جودو';
      case Style.bjj: return 'جيوجيتسو';
      case Style.kungfu: return 'كونغ فو';
      case Style.ninja: return 'نينجا';
      case Style.street: return 'دفاع الشارع';
      case Style.strength: return 'قوة';
      case Style.flexibility: return 'مرونة';
      case Style.weapons: return 'أسلحة';
    }
  }

  String _levelLabel(Level l) {
    switch (l) {
      case Level.beginner: return 'مبتدئ';
      case Level.intermediate: return 'متوسط';
      case Level.advanced: return 'متقدم';
    }
  }
}
