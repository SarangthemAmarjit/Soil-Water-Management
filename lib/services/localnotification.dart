import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
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
            if (notificationResponse.actionId == 'Yes') {
              // Handle the "Yes" action
              log('User chose to continue the water pump.');
            } else if (notificationResponse.actionId == 'No') {
              // Handle the "No" action
              log('User chose not to continue the water pump.');
            }
            break;
        }
      },
    );

    // final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    //     await notificationsPlugin.getNotificationAppLaunchDetails();

    // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    //   controller.setontapnotification();
    //   log('notificationResponse');
    // }
  }

  calcelnotification() async {
    await notificationsPlugin.cancelAll();
  }

  Future<void> onSelectNotification(String payload) async {
    print('Notification payload: $payload');
    if (payload == 'Yes') {
      // Handle the action for "Yes"
      print('User chose to continue the water pump.');
    } else if (payload == 'No') {
      // Handle the action for "No"
      print('User chose not to continue the water pump.');
    }
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
    int insistentFlag = 4;
    return NotificationDetails(
        android: AndroidNotificationDetails('1', 'channelName',
            channelDescription: 'your other channel description',
            importance: Importance.max,
            priority: Priority.high,
            ongoing: true,
            autoCancel: true,
            additionalFlags: Int32List.fromList(<int>[insistentFlag]),
            sound: const RawResourceAndroidNotificationSound('alarm2')));
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
