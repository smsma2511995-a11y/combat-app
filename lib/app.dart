// lib/app.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/settings_service.dart';
import 'screens/home_screen.dart';
import 'screens/exercise_player_screen.dart';
import 'screens/diet_screen.dart';
import 'screens/tips_screen.dart';
import 'screens/settings_screen.dart';

class FightTrainingApp extends StatelessWidget {
  const FightTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SettingsService().load(),
      builder: (_, __) {
        return MultiProvider(
          providers: [],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'فنون القتال المتكاملة',
            theme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: const ColorScheme.dark(
                primary: Color(0xFFFF6600),
                secondary: Colors.orange,
              ),
              scaffoldBackgroundColor: const Color(0xFF0F0F10),
              useMaterial3: true,
            ),
            routes: {
              '/': (_) => const HomeScreen(),
              '/player': (_) => const ExercisePlayerScreen(),
              '/diet': (_) => const DietScreen(),
              '/tips': (_) => const TipsScreen(),
              '/settings': (_) => const SettingsScreen(),
            },
          ),
        );
      },
    );
  }
}
