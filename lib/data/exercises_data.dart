// lib/data/exercises_data.dart

class Exercise {
  final String name;        // اسم التمرين
  final String description; // الوصف بالعربي
  final String imagePath;   // رابط الصورة أو الـ GIF
  final String category;    // القسم (كارتيه، جودو..)

  Exercise({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.category,
  });
}

final List<Exercise> exercises = [

  // 🥋 الكاراتيه
  Exercise(
    name: "الركلة الأمامية",
    description: "ركلة مباشرة للأمام لتقوية الساقين وزيادة التوازن.",
    imagePath: "assets/images/karate/front_kick.gif",
    category: "كاراتيه",
  ),
  Exercise(
    name: "الركلة الدائرية",
    description: "ركلة جانبية دائرية تستهدف الخصم من الجانب.",
    imagePath: "assets/images/karate/round_kick.gif",
    category: "كاراتيه",
  ),

  // 👐 الوينج تشون
  Exercise(
    name: "بونغ ساو",
    description: "حركة دفاع أساسية ضد اللكمات المباشرة.",
    imagePath: "assets/images/wingchun/bong_sau.gif",
    category: "وينج تشون",
  ),
  Exercise(
    name: "تان ساو",
    description: "حركة لصد الهجوم وفتح الطريق للهجوم المضاد.",
    imagePath: "assets/images/wingchun/tan_sau.gif",
    category: "وينج تشون",
  ),

  // 🐉 الكونغ فو
  Exercise(
    name: "وقفة الحصان",
    description: "وضعية لتقوية الساقين وزيادة الثبات.",
    imagePath: "assets/images/kungfu/horse_stance.gif",
    category: "كونغ فو",
  ),
  Exercise(
    name: "لكمة مستقيمة",
    description: "لكمة سريعة ومباشرة تُستخدم للهجوم.",
    imagePath: "assets/images/kungfu/straight_punch.gif",
    category: "كونغ فو",
  ),

  // 🥋 الجودو
  Exercise(
    name: "أوسوتو جاري",
    description: "رمي خارجي قوي لإسقاط الخصم.",
    imagePath: "assets/images/judo/osoto_gari.gif",
    category: "جودو",
  ),
  Exercise(
    name: "سيي ناغي",
    description: "رمي الكتف لإسقاط الخصم بسرعة.",
    imagePath: "assets/images/judo/seoi_nage.gif",
    category: "جودو",
  ),

  // 🤼‍♂️ الجيوجيتسو
  Exercise(
    name: "الخنق الخلفي",
    description: "حركة سيطرة قوية من الخلف لخنق الخصم.",
    imagePath: "assets/images/jiujitsu/rear_choke.gif",
    category: "جيوجيتسو",
  ),
  Exercise(
    name: "قفل الذراع",
    description: "تقنية للتحكم في ذراع الخصم وإجباره على الاستسلام.",
    imagePath: "assets/images/jiujitsu/armbar.gif",
    category: "جيوجيتسو",
  ),

  // 🥷 النينجا
  Exercise(
    name: "قفزة نينجا",
    description: "قفزة سريعة لتجاوز العقبات أو الهجوم.",
    imagePath: "assets/images/ninja/jump.gif",
    category: "نينجا",
  ),
  Exercise(
    name: "اختفاء سريع",
    description: "حركة سريعة للتخفي والابتعاد عن الخصم.",
    imagePath: "assets/images/ninja/vanish.gif",
    category: "نينجا",
  ),

  // 💪 المرونة وفتح الحوض
  Exercise(
    name: "فتح الحوض الجانبي",
    description: "تمرين لزيادة مرونة الساقين وفتح الحوض.",
    imagePath: "assets/images/flexibility/side_split.gif",
    category: "مرونة",
  ),
  Exercise(
    name: "تمدد أمامي",
    description: "إطالة عضلات الفخذ والخلفية.",
    imagePath: "assets/images/flexibility/front_stretch.gif",
    category: "مرونة",
  ),

  // 🥗 التغذية (نعرضها كقسم داخل التطبيق)
  Exercise(
    name: "نظام غذائي بسيط",
    description: "جدول وجبات رخيصة: فول، عدس، بطاطس، بيض، لبن، مكرونة.",
    imagePath: "assets/diet/cheap_diet.png",
    category: "تغذية",
  ),
];
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
