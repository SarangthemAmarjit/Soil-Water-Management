import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/pages/demo.dart';
// import 'package:soilmoisturedetector/demo.dart';
// import 'package:soilmoisturedetector/pages/dashboard.dart';
import 'package:soilmoisturedetector/router/router.dart';

import 'package:soilmoisturedetector/services/workmanager.dart';
import 'package:soilmoisturedetector/widget/localnotification.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().initNotification();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
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
      builder: EasyLoading.init(),
      theme: ThemeData(fontFamily: 'KulimPark'),
    );
  }
}
