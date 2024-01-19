// ignore_for_file: unnecessary_type_check

import 'dart:async';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/services/localnotification.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
      iosConfiguration: IosConfiguration(
          autoStart: true, onForeground: onStart, onBackground: onBackgound),
      androidConfiguration: AndroidConfiguration(
        autoStart: true,
        autoStartOnBoot: true,
        onStart: onStart,
        isForegroundMode: true,
      ));
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  GetxTapController controller = Get.put(GetxTapController());

  if (service is AndroidServiceInstance) {
    service.on('AsForeGround').listen((event) {
      service.setAsForegroundService();
    });
  }
  if (service is AndroidServiceInstance) {
    service.setAutoStartOnBootMode(GetPlatform.isAndroid);
    service.on('AsBackGround').listen((event) {
      service.setAsBackgroundService();
    });

    service.on('StopService').listen((event) {
      service.stopSelf();
      print("service stop");
    });

    Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          if (controller.latestfeeddata != null) {
            if (int.parse(controller.latestfeeddata!.field3) < 50) {
              service.setForegroundNotificationInfo(
                  title: 'ALERT ⚠️ ⚠️ ', content: 'Low Soil Moisture Level');
              NotificationService().showNotification(
                  title: '⚠️Critical Soil Moisture Level⚠️ ',
                  body: 'Tap Here Soon to Pump the Water');
            } else {
              service.setForegroundNotificationInfo(
                  title: 'Smart Irrigation System',
                  content:
                      'Current Soil Moisture Level : ${controller.latestfeeddata == null ? '' : controller.latestfeeddata!.field3}');
            }
          } else {
            service.setForegroundNotificationInfo(
                title: 'Smart Irrigation System', content: 'SERVER ERROR');
          }
        }
      }
    });

    print('background service running');
    service.invoke('update');
  }
}

@pragma('vm:entry-point')
FutureOr<bool> onBackgound(ServiceInstance service) {
  return true;
}
