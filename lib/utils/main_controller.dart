import 'package:flutter/material.dart';
import 'package:taskscore/components/custom_bottom_bar.dart';
import 'package:taskscore/pages/home.dart';
import 'package:taskscore/pages/ranking_screen.dart';

class MainController extends StatefulWidget {
  const MainController({super.key});

  @override
  State<MainController> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  int currentIndex = 1; // <- começa em "Tarefas"

  final pages = [
    Placeholder(),            // Mais
    HomeScreen(),             // Tarefas
    Placeholder(),            // Calendário
    Placeholder(),            // Perfil
    RankingScreen(),          // Ranking
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
