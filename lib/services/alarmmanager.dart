import 'package:soilmoisturedetector/widget/localnotification.dart';

Future<void> backgroundHandler() async {
  // Check soil humidity and show notifications
  final notificationService = NotificationService();
  await notificationService.showNotification(
      title: 'Checking ', body: 'Tap Here Soon to Pump the Water');
}
