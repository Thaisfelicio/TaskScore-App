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
                _OptionButton(label: 'Repetir', value: 'desligado', onTap: () {
                  Navigator.pushNamed(context, '/repeat');
                }),
                _OptionButton(label: 'Tempo', value: 'até 10h'),
                _OptionButton(label: 'Lembrete', value: 'personalizado'),
                _OptionButton(label: 'Categoria', value: 'pessoal'),
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
  final VoidCallback? onTap;

  const _OptionButton({required this.label, required this.value, this.onTap});

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
              Icon(Icons.repeat, color: Colors.black),
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
