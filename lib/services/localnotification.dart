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
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            log('Notification check 1');
            controller.setontapnotification();
            // selectNotificationStream.add(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            log('Notification check 2');

            break;
        }
      },
    );

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await notificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      controller.setontapnotification();
      log('notificationResponse');
    }
  }

  calcelnotification() async {
    await notificationsPlugin.cancelAll();
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

  showalarmnotification() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('1', 'channelName',
            channelDescription: 'your other channel description',
            audioAttributesUsage: AudioAttributesUsage.alarm,
            category: AndroidNotificationCategory.alarm,
            priority: Priority.high,
            importance: Importance.max,
            ongoing: true,
            autoCancel: true,
            playSound: true,
            sound: RawResourceAndroidNotificationSound('alarm2')));
  }

  Future showalarmwarning(
      {int id = 1, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await showalarmnotification());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }
}
