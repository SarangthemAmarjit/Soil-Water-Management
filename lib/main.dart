// import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:soilmoisturedetector/pages/demo.dart';
// import 'package:get/get.dart';
// import 'package:soilmoisturedetector/controller/tapcontroller.dart';
// import 'package:soilmoisturedetector/pages/demo.dart';
// import 'package:soilmoisturedetector/demo.dart';
// import 'package:soilmoisturedetector/pages/dashboard.dart';
import 'package:soilmoisturedetector/router/router.dart';
import 'package:soilmoisturedetector/services/alarmmanager.dart';
import 'package:soilmoisturedetector/services/backgroundservoces.dart';
// import 'package:soilmoisturedetector/services/backgroundservoces.dart';

// import 'package:soilmoisturedetector/services/workmanager.dart';
import 'package:soilmoisturedetector/services/localnotification.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main() async {
  int alarmId = 1;

  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().initNotification();
  await initializeService();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  runApp(const MyApp());
  // await AndroidAlarmManager.cancel(alarmId);
  // await AndroidAlarmManager.initialize();
  // AndroidAlarmManager.periodic(
  //     const Duration(seconds: 3), alarmId, backgroundHandler,
  //     allowWhileIdle: true, rescheduleOnReboot: true, exact: true);
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
      theme: ThemeData(fontFamily: 'KulimPark'),
    );
  }
}
