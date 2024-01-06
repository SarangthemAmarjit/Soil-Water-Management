import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/model/radialindicator.dart';
import 'package:soilmoisturedetector/widget/chartdata.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 247, 249),
      body: GetBuilder<GetxTapController>(builder: (_) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return RadialIndicatorSoil(
                            value: controller.latestfeeddata!.field3,
                          );
                        case 1:
                          return RadialIndicatorSoil(
                            value: controller.latestfeeddata!.field2,
                          );
                        case 2:
                          return RadialIndicatorSoil(
                            value: controller.latestfeeddata!.field4,
                          );
                        case 3:
                          return RadialData(
                            nitro: controller.latestfeeddata!.field4,
                            phos: controller.latestfeeddata!.field5,
                            potas: controller.latestfeeddata!.field6,
                          );

                        default:
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
