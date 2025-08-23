// lib/widgets/side_drawer.dart
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const ListTile(
              title: Text('فنون القتال المتكاملة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text('تدريب دفاع شخصي شامل'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('التمارين اليومية'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('أنظمة غذائية'),
              onTap: () => Navigator.pushNamed(context, '/diet'),
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text('نصائح وإرشادات'),
              onTap: () => Navigator.pushNamed(context, '/tips'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('الإعدادات'),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
    );
  }
}
