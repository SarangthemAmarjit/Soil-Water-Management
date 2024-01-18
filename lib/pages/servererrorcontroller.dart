import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/pages/dashboard.dart';
import 'package:soilmoisturedetector/pages/servererrorpage.dart';

@RoutePage()
class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    return GetBuilder<GetxTapController>(builder: (_) {
      if (controller.isserverok) {
        return const HomePage();
      } else {
        return const ServerErrorPage();
      }
    });
  }
}
