import 'package:flutter/material.dart';
import 'package:taskscore/pages/home.dart';
import 'package:taskscore/pages/ranking_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _items = [
    {'icon': Icons.menu, 'label': 'Mais', 'route': null},
    {'icon': Icons.checklist, 'label': 'Tarefas', 'route': HomeScreen()},
    {'icon': Icons.calendar_today, 'label': 'Calendário', 'route': null},
    {'icon': Icons.person, 'label': 'Perfil', 'route': null},
    {'icon': Icons.emoji_events, 'label': 'Ranking', 'route': RankingScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF9999FF), // Azul claro da barra
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          final isSelected = index == _selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;

              });
              final route = item['route'];
               if(route != null) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> route));
               }
              
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item['icon'],
                  color: isSelected ? Colors.white : Colors.yellow,
                  size: 28,
                ),
                const SizedBox(height: 4),
                Text(
                  item['label'],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.yellow,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
