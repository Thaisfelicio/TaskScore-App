import 'package:flutter/material.dart';

class RepeatConfigScreen extends StatefulWidget {
  const RepeatConfigScreen({super.key});

  @override
  State<RepeatConfigScreen> createState() => _RepeatConfigScreenState();
}

class _RepeatConfigScreenState extends State<RepeatConfigScreen> {
  String repeat = 'Sem repetição';

  @override
  Widget build(BuildContext context) {
    final options = [
      'Sem repetição',
      'Diariamente',
      'Semanalmente',
      'Mensalmente',
      'Anualmente'
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFB2F2BB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB2F2BB),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Configurar repetição', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: options.map((opt) {
          return RadioListTile<String>(
            title: Text(opt),
            value: opt,
            groupValue: repeat,
            onChanged: (value) {
              setState(() => repeat = value!);
            },
          );
        }).toList(),
      ),
    );
  }
}
