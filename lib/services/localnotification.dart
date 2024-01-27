import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  GetxTapController controller = Get.put(GetxTapController());

  Future<void> initNotification() async {
    notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      controller.setontapnotification();

      log('fafafaf');
    });
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            category: AndroidNotificationCategory.event,
            groupAlertBehavior: GroupAlertBehavior.all,
            playSound: true,
            enableVibration: true,
            priority: Priority.high,
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  showalarmnotification() async {
    await notificationsPlugin.cancelAll();

    const AndroidNotificationDetails('14', 'fafsf',
        channelDescription: 'your other channel description',
        audioAttributesUsage: AudioAttributesUsage.alarm,
        category: AndroidNotificationCategory.alarm,
        priority: Priority.high,
        importance: Importance.max,
        ongoing: true,
        autoCancel: true,
        sound: RawResourceAndroidNotificationSound('alarm2'));
  }

  Future showalarmwarning(
      {int id = 0, String? title, String? body, String? payLoad}) async {}

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }
}
