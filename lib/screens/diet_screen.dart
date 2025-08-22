import 'package:flutter/material.dart';

class DietScreen extends StatelessWidget {
  final meals = [
    {"meal": "فطار", "menu": "فول + رغيف + شاي/لبن"},
    {"meal": "غداء", "menu": "عدس أو مكرونة + بيضة"},
    {"meal": "عشاء", "menu": "بطاطس + جبنة + رغيف"},
    {"meal": "سناك", "menu": "موزة أو شوفان"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("النظام الغذائي")),
      body: ListView(
        children: meals.map((m) {
          return Card(
            child: ListTile(
              title: Text(m["meal"]!, style: TextStyle(fontSize: 20, color: Colors.orange)),
              subtitle: Text(m["menu"]!, style: TextStyle(fontSize: 18)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
