import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:soilmoisturedetector/widget/localnotification.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MyCountdownTimer extends StatefulWidget {
  const MyCountdownTimer({super.key});

  @override
  _MyCountdownTimerState createState() => _MyCountdownTimerState();
}

class _MyCountdownTimerState extends State<MyCountdownTimer> {
  final int _secondsRemaining = 300; // 5 minutes in seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  bool isselected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: Center(
        child: Column(
          children: [
            ToggleSwitch(
              minWidth: 90.0,
              cornerRadius: 15.0,
              activeBgColors: const [
                [
                  Color(0xffdc6c73),
                ],
                [
                  Color.fromARGB(255, 60, 205, 130),
                ]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: const Color.fromARGB(255, 58, 60, 62),
              inactiveFgColor: Colors.white,
              initialLabelIndex: isselected ? 1 : 0,
              totalSwitches: 2,
              labels: const ['OFF', 'ON'],
              radiusStyle: true,
              onToggle: (index) {
                setState(() {
                  isselected = !isselected;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  NotificationService().showNotification(
                      title: 'Done',
                      body: '5 min Water Pump Completed Successfully');
                },
                child: const Text('check Notification'))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
}
