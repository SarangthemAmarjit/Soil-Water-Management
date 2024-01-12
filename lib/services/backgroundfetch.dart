// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:background_fetch/background_fetch.dart';

// class NotificationService2 {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initialize() async {
//     // ... existing code

//     await BackgroundFetch.configure(
//       BackgroundFetchConfig(
//         minimumFetchInterval: 1, // set your desired interval in minutes
//         stopOnTerminate: false,
//         enableHeadless: true,
//         startOnBoot: true,
//       ),
//       (String taskId) async {
//         // Check soil humidity and show notifications
//         await _showNotification();
//         BackgroundFetch.finish(taskId);
//       },
//       (String taskId) async {
//         // Handle task timeout or failure
//         BackgroundFetch.finish(taskId);
//       },
//     );
//   }

//   Future<void> _showNotification() async {
//     // Show your notification here
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Soil Humidity Alert',
//       'The soil humidity is low. Please irrigate your plants.',
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'your_channel_id',
//           'your_channel_name',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//     );
//   }
// }
