// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:soilmoisturedetector/widget/localnotification.dart';
// import 'package:workmanager/workmanager.dart';

// class NotificationService3 {
//   Future<void> initialize() async {
//     // ... existing code

//     Workmanager().initialize(
//       callbackDispatcher,
//       isInDebugMode: true, // Set to true if running in debug mode
//     );
//   }

//   Future<void> scheduleBackgroundTask() async {
//     await Workmanager().registerPeriodicTask(
//       frequency: const Duration(seconds: 15),
//       'backgroundTask',
//       'simpleTask',
//       inputData: <String, dynamic>{},
//     );
//   }

//   static void callbackDispatcher() {
//     Workmanager().executeTask((task, inputData) async {
//       // Check soil humidity and show notifications
//       final notificationService = NotificationService();
//       await notificationService.showNotification(
//           title: '⚠️Critical Soil Moisture Level⚠️ ',
//           body: 'Tap Here Soon to Pump the Water');
//       return Future.value(true);
//     });
//   }
// }
