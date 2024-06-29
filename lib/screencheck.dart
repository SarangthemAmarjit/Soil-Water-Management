import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/view/mobile/pages/servererrorpage.dart';
import 'package:soilmoisturedetector/view/web/pages/dashboard.dart';

import 'view/mobile/pages/dashboard.dart';

@RoutePage()
class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (controller.isserverok) {
            if (constraints.maxWidth < 800) {
              // If the screen width is less than 600, return the mobile view
              return const HomePage();
            } else {
              // If the screen width is 600 or more, return the web view
              return const WebHomePage();
            }
          } else {
            return const ServerErrorPage();
          }
        },
      ),
    );
  }
}
