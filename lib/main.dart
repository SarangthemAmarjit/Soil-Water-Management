import 'package:flutter/material.dart';
import 'package:soilmoisturedetector/demo.dart';
import 'package:soilmoisturedetector/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'KulimPark'),
        home: const HomePage());
  }
}
