import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
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
                            title: 'Soil Humadity',
                            value: controller.latestfeeddata!.field3,
                          );
                        case 1:
                          return RadialIndicatorSoil(
                            title: 'Soil Temperature',
                            value: controller.latestfeeddata!.field2,
                          );
                        case 2:
                          return RadialIndicatorSoil(
                            title: 'pH Level',
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

class RadialIndicatorSoil extends StatelessWidget {
  final String title;
  final String value;

  const RadialIndicatorSoil({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      color: Colors.white,
      child: SfRadialGauge(
        title: GaugeTitle(text: title),
        axes: <RadialAxis>[
          RadialAxis(
            annotations: [
              GaugeAnnotation(
                  widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset('assets/images/soil.png', height: 70),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    value.isEmpty ? 'N/A' : '$value%',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ))
            ],
            showLabels: false,
            showTicks: false,
            pointers: <GaugePointer>[
              RangePointer(
                  enableAnimation: true,
                  animationType: AnimationType.bounceOut,
                  value: value.isEmpty ? 0.0 : double.parse(value),
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.startCurve,
                  gradient: const SweepGradient(colors: <Color>[
                    Color(0xFFa4edeb),
                    Color(0xFF00a9b5),
                  ], stops: <double>[
                    0.25,
                    0.75
                  ])),
              MarkerPointer(
                value: value.isEmpty ? 0.0 : double.parse(value),
                markerType: MarkerType.circle,
                color: const Color.fromARGB(129, 135, 232, 232),
              )
            ],
          ),
        ],
      ),
    );
  }
}
