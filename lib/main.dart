import 'package:flutter/material.dart';
// import 'package:soilmoisturedetector/demo.dart';
// import 'package:soilmoisturedetector/pages/dashboard.dart';
import 'package:soilmoisturedetector/router/router.dart';

void main() {
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'KulimPark'),
      // home: const HomePage()
    );
  }
}
