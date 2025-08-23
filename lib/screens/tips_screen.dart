// lib/screens/tips_screen.dart
import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final tips = <String>[
      'ابدأ بإحماء 5-10 دقائق لتجنب الإصابات.',
      'تدرّج من المستوى السهل للأصعب — لا تتجاوز حدودك.',
      'حافظ على تنفس ثابت: شهيق في التحضير، زفير مع الجهد.',
      'الماء أولاً: اشرب قبل، أثناء، وبعد التمرين.',
      'لا تختبر دفاعات ضد سلاح حقيقي — التعلم لأغراض السلامة فقط.',
      'توقّف إذا شعرت بألم حاد، واستشر مختصاً.',
      'حافظ على وضعية الجسم — الظهر مستقيم والركبتان لينتان.',
      'سجّل تقدمك: زمن، تكرارات، إحساس الصعوبة.',
      'التغذية والراحة جزء من التدريب — نم 7-8 ساعات.',
      'درّب رد الفعل: استجب لإشارة بصرية/صوتية سريعة.'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('نصائح وإرشادات')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: tips.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.check_circle_outline),
          title: Text(tips[i]),
        ),
      ),
    );
  }
}
