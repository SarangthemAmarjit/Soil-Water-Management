import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/services/localnotification.dart';

@pragma('vm:entry-point')
void backgroundHandler() {
  GetxTapController controller = Get.put(GetxTapController());

  // Check soil humidity and show notifications
  final notificationService = NotificationService();

  if (int.parse(controller.latestfeeddata!.field3) < 50) {
    notificationService.showNotification(
        title: '⚠️Critical Soil Moisture Level⚠️ ',
        body: 'Tap Here Soon to Pump the Water');
  }
}
