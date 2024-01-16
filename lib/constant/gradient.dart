import 'package:flutter/material.dart';

SweepGradient getPhLevelGradient(double phLevel) {
  switch (phLevel) {
    case 0:
      return const SweepGradient(
        colors: [Colors.red],
      );
    case 1:
      return const SweepGradient(
        colors: [Colors.red, Colors.orange],
      );
    case 2:
      return const SweepGradient(
        colors: [Colors.red, Colors.orange, Colors.amber],
      );
    case 3:
      return const SweepGradient(
        colors: [Colors.red, Colors.orange, Colors.amber, Colors.yellow],
      );
    case 4:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime
        ],
      );
    case 5:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent
        ],
      );

    case 6:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
        ],
      );
    case 7:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green
        ],
      );
    case 8:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green,
          Colors.greenAccent
        ],
      );
    case 9:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green,
          Colors.greenAccent,
          Colors.teal
        ],
      );
    case 10:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green,
          Colors.greenAccent,
          Colors.teal,
          Colors.lightBlue
        ],
      );
    case 11:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green,
          Colors.greenAccent,
          Colors.teal,
          Colors.lightBlue
        ],
      );
    case 12:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green,
          Colors.greenAccent,
          Colors.teal,
          Colors.lightBlue,
          Colors.blue
        ],
      );
    case 13:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green,
          Colors.greenAccent,
          Colors.teal,
          Colors.lightBlue,
          Colors.blue,
          Colors.purple
        ],
      );
    case 14:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green,
          Colors.greenAccent,
          Colors.teal,
          Colors.lightBlue,
          Colors.blue,
          Colors.purple,
          Colors.deepPurple
        ],
      );

    default:
      return const SweepGradient(
        colors: [
          Colors.red,
          Colors.orange,
          Colors.amber,
          Colors.yellow,
          Colors.lime,
          Colors.lightGreenAccent,
          Colors.lightGreen,
          Colors.green,
          Colors.greenAccent,
          Colors.teal,
          Colors.lightBlue,
          Colors.blue,
          Colors.purple,
          Colors.deepPurple
        ],
      );
  }
}
