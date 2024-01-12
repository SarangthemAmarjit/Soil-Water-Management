// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:soilmoisturedetector/controller/tapcontroller.dart';
// import 'package:soilmoisturedetector/widget/localnotification.dart';
// import 'package:workmanager/workmanager.dart';
// import 'package:http/http.dart' as http;

// void callbackDispatcher() {
//   GetxTapController controller = Get.put(GetxTapController());
//   Workmanager().executeTask((task, inputData) async {
//     // Your background task logic goes here
//     log("Background Task is running");
//     if (controller.latestfeeddata != null) {
//       if (int.parse(controller.latestfeeddata!.field3) < 50) {
//         // service.setForegroundNotificationInfo(
//         //     title: 'ALERT ⚠️ ⚠️ ', content: 'Low Soil Moisture Level');
//         NotificationService().showNotification(
//             title: '⚠️Critical Soil Moisture Level⚠️ ',
//             body: 'Tap Here Soon to Pump the Water');
//       } else {
//         NotificationService().showNotification(
//             title: 'Smart Irrigation System ',
//             body:
//                 'Current Soil Moisture Level : ${controller.latestfeeddata == null ? '' : controller.latestfeeddata!.field3}');
//         // service.setForegroundNotificationInfo(
//         //     title: 'Smart Irrigation System',
//         //     content:
//         //         'Current Soil Moisture Level : ${controller.latestfeeddata == null ? '' : controller.latestfeeddata!.field3}');
//       }
//     }

//     // Simulate some work
//     await Future.delayed(const Duration(seconds: 3));

//     // Send value to API

//     // Return success
//     return Future.value(true);
//   });
// }

// // Future<void> sendValueToApi() async {
// //   // Replace the following URL with your API endpoint
// //   final apiUrl = 'https://your-api-endpoint.com';

// //   // Replace the payload with the data you want to send
// //   final payload = {'value': 1};

// //   try {
// //     final response = await http.post(
// //       Uri.parse(apiUrl),
// //       body: jsonEncode(payload),
// //       headers: {'Content-Type': 'application/json'},
// //     );

// //     if (response.statusCode == 200) {
// //       print('API call successful');
// //     } else {
// //       print('API call failed with status code: ${response.statusCode}');
// //     }
// //   } catch (e) {
// //     print('Error during API call: $e');
// //   }
// // }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool switchValue = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('WorkManager Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Switch(
//                 value: switchValue,
//                 onChanged: (value) {
//                   setState(() {
//                     switchValue = value;
//                     if (value) {
//                       // Schedule a periodic background task every 5 minutes
//                       Workmanager().registerPeriodicTask(
//                         "1",
//                         "simpleTask",
//                         frequency: const Duration(minutes: 5),
//                       );
//                     } else {
//                       // Cancel the periodic task when the switch is turned off
//                       Workmanager().cancelByUniqueName("1");
//                     }
//                   });
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: const Text('Manually Trigger Background Task'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
