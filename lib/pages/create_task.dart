import 'package:flutter/material.dart';
import 'package:taskscore/utils/task.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TaskCategory selectedCategory = TaskCategory.personal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criar Tarefa")),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TÍTULO
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Título"),
            ),

            SizedBox(height: 20),

            /// CATEGORIA
            DropdownButton<TaskCategory>(
              value: selectedCategory,
              items: TaskCategory.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Row(
                    children: [
                      category.assetImage,
                      SizedBox(width: 10),
                      Text(category.label),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            SizedBox(height: 20),

            /// DATA
            Text("Data: ${selectedDate.toLocal()}".split(' ')[0]),
            ElevatedButton(
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Text("Escolher Data"),
            ),

            Spacer(),

            /// BOTÃO SALVAR
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty) return;

                Task newTask = Task(
                  title: titleController.text,
                  date: selectedDate,
                  repeat: RepeatOption.none,
                  reminder: ReminderOption.none,
                  category: selectedCategory,
                );

                Navigator.pop(context, newTask);
              },
              child: Text("Salvar Tarefa"),
            ),

          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:taskscore/utils/task.dart';

// class CreateTaskPage extends StatefulWidget {
//   const CreateTaskPage({super.key});

//   @override
//   CreateTaskPageState createState() => CreateTaskPageState();
// }

// class CreateTaskPageState extends State<CreateTaskPage> {
//   DateTime selectedDate = DateTime.now();
//   RepeatOption repeat = RepeatOption.none;
//   TimeOfDay? selectedTime;
//   ReminderOption reminder = ReminderOption.none;
//   TaskCategory category = TaskCategory.personal;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Nova tarefa")),
//       body: Column(
//         children: [
//           // Calendário
//           CalendarDatePicker(
//             initialDate: selectedDate,
//             firstDate: DateTime(2020),
//             lastDate: DateTime(2030),
//             onDateChanged: (d) => setState(() => selectedDate = d),
//           ),

//           // 🔁 Repetir
//           _buildOptionTile(
//             icon: Icons.repeat,
//             label: "Repetir",
//             value: repeat.name,
//             onTap: () => _selectRepeat(),
//           ),

//           // ⏰ Tempo
//           _buildOptionTile(
//             icon: Icons.access_time,
//             label: "Tempo",
//             value: selectedTime != null ? selectedTime!.format(context) : "nenhum",
//             onTap: () => _selectTime(),
//           ),

//           // 🔔 Lembrete
//           _buildOptionTile(
//             icon: Icons.notifications,
//             label: "Lembrete",
//             value: reminder.name,
//             onTap: () => _selectReminder(),
//           ),

//           // 🏷 Categoria
//           _buildOptionTile(
//             icon: category.icon,
//             label: "Categoria",
//             value: category.label,
//             onTap: () => _selectCategory(),
//           ),

//           const Spacer(),

//           // Botão Criar
//           ElevatedButton(
//             onPressed: _createTask,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.yellow,
//               foregroundColor: Colors.black,
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
//             ),
//             child: const Text("Criar tarefas"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void _selectRepeat() async {
//   final result = await showModalBottomSheet<RepeatOption>(
//     context: context,
//     builder: (context) => Column(
//       mainAxisSize: MainAxisSize.min,
//       children: RepeatOption.values.map((opt) {
//         return ListTile(
//           title: Text(opt.name),
//           onTap: () => Navigator.pop(context, opt),
//         );
//       }).toList(),
//     ),
//   );

//   if (result != null) setState(() => repeat = result);
// }

// void _selectCategory() async {
//   final result = await showModalBottomSheet<TaskCategory>(
//     context: context,
//     builder: (context) => Column(
//       mainAxisSize: MainAxisSize.min,
//       children: TaskCategory.values.map((cat) {
//         return ListTile(
//           leading: Container(
//   width: 40,
//   height: 40,
//   decoration: BoxDecoration(
//     color: cat.color,
//     shape: BoxShape.circle,
//   ),
//   child: Center(child: cat.assetImage)),
//           title: Text(cat.label),
//           onTap: () => Navigator.pop(context, cat),
//         );
//       }).toList(),
//     ),
//   );

//   if (result != null) setState(() => category = result);
// }

// void _createTask() {
//   final task = Task(
//     title: "Nova tarefa",
//     date: selectedDate,
//     repeat: repeat,
//     time: selectedTime,
//     reminder: reminder,
//     category: category,
//   );

//   Navigator.pop(context, task);
// }

// Widget buildTask(Task task) {
//   return ListTile(
//     leading: CircleAvatar(
//       backgroundColor: task.category.color,
//       child: Icon(task.category.icon, color: Colors.white),
//     ),
//     title: Text(task.title),
//     subtitle: Text("${task.category.label}"),
//   );
// }
