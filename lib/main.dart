// import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:soilmoisturedetector/view/mobile/pages/contactUs.page.dart';
import 'package:soilmoisturedetector/view/mobile/pages/dashboard.dart';
import 'package:soilmoisturedetector/router/router.dart';
import 'package:soilmoisturedetector/services/backgroundservoces.dart';
// import 'package:soilmoisturedetector/services/backgroundservoces.dart';

// import 'package:soilmoisturedetector/services/workmanager.dart';
import 'package:soilmoisturedetector/services/localnotification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await NotificationService().initNotification();
  // await initializeService();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
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
      title: 'Agri Sense',
      builder: EasyLoading.init(),
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'KulimPark',
          useMaterial3: false
          /* light theme settings */
          ),
      // darkTheme: ThemeData(brightness: Brightness.dark, fontFamily: 'KulimPark'
      //     /* dark theme settings */
      //     ),
      // home: const ContactPage(),
    );
  }
}
