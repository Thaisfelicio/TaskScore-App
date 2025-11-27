import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PlanSemesterScreen extends StatefulWidget {
  const PlanSemesterScreen({super.key});

  @override
  State<PlanSemesterScreen> createState() => _PlanSemesterScreenState();
}

class _PlanSemesterScreenState extends State<PlanSemesterScreen> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  String repeatValue = "desligado";
String timeValue = "personalizado";
String reminderValue = "personalizado";
String categoryValue = "pessoal";

  Future<void> _selectCategory() async {
  final options = ["estudos", "pessoal", "atividade física", "trabalho"];

  final newValue = await showModalBottomSheet<String>(
    context: context,
    builder: (context) => ListView(
      shrinkWrap: true,
      children: options.map((op) => ListTile(
        title: Text(op),
        onTap: () => Navigator.pop(context, op),
      )).toList(),
    ),
  );

  if (newValue != null) {
    setState(() => categoryValue = newValue);
  }
}

Future<void> _selectReminder() async {
  final options = [
    "nenhum",
    "10 min antes",
    "1h antes",
    "personalizado",
  ];

  final newValue = await showModalBottomSheet<String>(
    context: context,
    builder: (context) => ListView(
      shrinkWrap: true,
      children: options.map((op) => ListTile(
        title: Text(op),
        onTap: () => Navigator.pop(context, op),
      )).toList(),
    ),
  );

  if (newValue != null) {
    setState(() => reminderValue = newValue);
  }
}

Future<void> _selectTime() async {
  final options = ["manhã", "tarde", "noite", "até 10h"];

  final newValue = await showModalBottomSheet<String>(
    context: context,
    builder: (context) => ListView(
      shrinkWrap: true,
      children: options.map((op) {
        return ListTile(
          title: Text(op),
          onTap: () => Navigator.pop(context, op),
        );
      }).toList(),
    ),
  );

  if (newValue != null) {
    setState(() => timeValue = newValue);
  }
}

Future<void> _selectRepeat() async {
  final options = ["desligado", "diário", "semanal", "mensal", "anual"];

  final newValue = await showModalBottomSheet<String>(
    context: context,
    builder: (context) => ListView(
      shrinkWrap: true,
      children: options.map((op) {
        return ListTile(
          title: Text(op),
          onTap: () => Navigator.pop(context, op),
        );
      }).toList(),
    ),
  );

  if (newValue != null) {
    setState(() => repeatValue = newValue);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text('Planejar o semestre', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Nova tarefa', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 16),

            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime(DateTime.now().year, DateTime.now().month + 6),
              focusedDay: focusedDay,
              selectedDayPredicate: (day) => isSameDay(selectedDay, day),
              onDaySelected: (selected, focused) {
                setState(() {
                  selectedDay = selected;
                  focusedDay = focused;
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.amber.withValues(/*0.5*/),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botões de opções
            Column(
              children: [
                 _OptionButton(
      label: 'Repetir',
      value: repeatValue,
      icon: Icons.repeat,
      onTap: _selectRepeat,
    ),
    _OptionButton(
      label: 'Tempo',
      value: timeValue,
      icon: Icons.access_time,
      onTap: _selectTime,
    ),
    _OptionButton(
      label: 'Lembrete',
      value: reminderValue,
      icon: Icons.notifications,
      onTap: _selectReminder,
    ),
    _OptionButton(
      label: 'Categoria',
      value: categoryValue,
      icon: Icons.label,
      onTap: _selectCategory,
    ),
              ],
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[600],
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {},
              child: const Text('Criar tarefas', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;

  const _OptionButton({
    required this.label,
    required this.value,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            ]),
            Text(value),
          ],
        ),
      ),
    );
  }
}


