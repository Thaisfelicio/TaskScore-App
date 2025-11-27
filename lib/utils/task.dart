import 'package:flutter/material.dart';

class Task {
  String title;
  DateTime date;
  RepeatOption repeat;
  TimeOfDay? time;
  ReminderOption reminder;
  TaskCategory category;

  Task({
    required this.title,
    required this.date,
    required this.repeat,
    required this.reminder,
    required this.category,
    this.time,
  });
}

enum RepeatOption {
  none,
  daily,
  weekly,
  monthly,
  yearly,
}

enum ReminderOption {
  none,
  custom,
  tenMinutesBefore,
  oneHourBefore,
}

enum TaskCategory {
  studies,
  personal,
  workout,
  work,
}

extension TaskCategoryData on TaskCategory {
  String get label {
    switch (this) {
      case TaskCategory.studies:
        return 'Estudos';
      case TaskCategory.personal:
        return 'Pessoal';
      case TaskCategory.workout:
        return 'Atividade Física';
      case TaskCategory.work:
        return 'Trabalho';
    }
  }

  Image get assetImage {
    switch (this) {
      case TaskCategory.studies:
        return Image.asset('lib/images/book.png', width: 30,);
      case TaskCategory.personal:
        return Image.asset('lib/images/heart.png', width: 30,);
      case TaskCategory.workout:
        return Image.asset('lib/images/sneakers.png', width: 30,);
      case TaskCategory.work:
        return Image.asset('lib/images/briefcase.png', width: 30,);
    }
  }

  Color get color {
    switch (this) {
      case TaskCategory.studies:
        return Colors.blue;
      case TaskCategory.personal:
        return Colors.pink;
      case TaskCategory.workout:
        return Colors.green;
      case TaskCategory.work:
        return Colors.orange;
    }
  }
}
