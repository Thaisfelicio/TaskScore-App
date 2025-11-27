import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:taskscore/components/custom_top_bar.dart';
import 'package:taskscore/pages/create_task.dart';
import 'package:taskscore/pages/plan_semester.dart';
import 'package:taskscore/utils/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1E6),
      body:Column(
        children: [
          WeekTopBar(),
          Center(child: Text('Nenhuma tarefa criada',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),)),
        ],
      ),
      floatingActionButton: Padding(padding: EdgeInsets.only(right: 40),
      child: SpeedDial(
        icon: Icons.add,
        iconTheme: IconThemeData(color: Colors.brown, size: 40),
        backgroundColor: const Color(0xFFFFEB3B),
        elevation: 6,
        spacing: 10,
        spaceBetweenChildren: 10,
        overlayOpacity: 0,
        childrenButtonSize: Size(220, 60),
        direction: SpeedDialDirection.up,
        
        children: [
          SpeedDialChild(
            // label: 'Criar uma tarefa',
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.only(right: 40),
              child: _menuItem('Criar uma tarefa', Color(0xFFFFF3B5), context),),
            //   onTap: () async {
            //     final Task? newTask = await Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => CreateTaskScreen(),
            //     ),
            //   );
            //   if (newTask != null) {
            //     _addTask(newTask);
            //   }
            // },
          ),
          SpeedDialChild(
            // label: 'Planejar o mês',
            child: Padding(padding: EdgeInsets.only(right: 40),
            child: _menuItem('Planejar o mês', Color(0xFFFFF3B5), context),),
            
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          SpeedDialChild(
            // label: 'Planejar o semestre',
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Padding(padding: EdgeInsets.only(right: 40),
            child: _menuItem('Planejar o semestre', Color(0xFFFFF3B5), context),),
            
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlanSemesterScreen(),)),
          ),
          SpeedDialChild(
            // label: 'Planejar o ano',
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Padding(padding: EdgeInsets.only(right: 40),
            child: _menuItem('Planejar o ano', Color(0xFFFFF3B5), context))
            
          ),
        ],
      ),)
      
    );
  }
}

  

Widget _menuItem(String texto, Color cor, BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 1,
    // width: 220,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      // margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: Offset(1, 2),
          )
        ],
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    )
  );
  
}

