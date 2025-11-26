import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:taskscore/components/custom_bottom_bar.dart';
import 'package:taskscore/components/custom_top_bar.dart';
import 'package:taskscore/pages/plan_semester.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      // appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: WeekTopBar()),
      backgroundColor: const Color(0xFFFFF1E6),
      body:Column(
        children: [
          WeekTopBar(),
          Center(child: Text('Conteúdo da tela inicial')),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        backgroundColor: const Color(0xFFFFEB3B),
        overlayOpacity: 0,
        children: [
          SpeedDialChild(
            label: 'Criar uma tarefa',
            backgroundColor: Colors.yellow[200],
            onTap: () => Navigator.pushNamed(context, '/new-task'),
          ),
          SpeedDialChild(
            label: 'Planejar o mês',
            backgroundColor: Colors.yellow[300],
          ),
          SpeedDialChild(
            label: 'Planejar o semestre',
            backgroundColor: Colors.yellow[400],
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlanSemesterScreen(),)),
          ),
          SpeedDialChild(
            label: 'Planejar o ano',
            backgroundColor: Colors.yellow[500],
          ),
        ],
      ),
    );
  }
}
