import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Timer App'),
        ),
        body: const TimerSettings(),
      ),
    );
  }
}

class TimerSettings extends StatefulWidget {
  const TimerSettings({super.key});

  @override
  _TimerSettingsState createState() => _TimerSettingsState();
}

class _TimerSettingsState extends State<TimerSettings> {
  final TextEditingController _minutesController = TextEditingController();
  int _minutes = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: TextField(
              controller: _minutesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter minutes'),
              onChanged: (value) {
                setState(() {
                  _minutes = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),
          const SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () {
              // Add your timer logic here
              print('Set timer for $_minutes minutes');
            },
            child: const Text('Go'),
          ),
        ],
      ),
    );
  }
}
