import 'package:flutter/material.dart';

enum TaskCategory { estudos, pessoal, exercicio, trabalho }

class CategoryData {
  static const Map<TaskCategory, Map<String, dynamic>> info = {
    TaskCategory.estudos: {'color': Colors.blue, 'icon': Icons.book},
    TaskCategory.pessoal: {'color': Colors.pink, 'icon': Icons.favorite},
    TaskCategory.exercicio: {'color': Colors.orange, 'icon': Icons.directions_bike},
    TaskCategory.trabalho: {'color': Colors.green, 'icon': Icons.work},
  };
}
