import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialIndicatorSoil extends StatelessWidget {
  final String? value;
  final int index;
  const RadialIndicatorSoil({
    super.key,
    this.value,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    return Obx(
      () => controller.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  annotations: [
                    GaugeAnnotation(
                        widget: Text(
                      value == null
                          ? 'N/A'
                          : index == 0
                              ? '$value%'
                              : index == 1
                                  ? '$value°C'
                                  : value!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ))
                  ],
                  showLabels: false,
                  showTicks: false,
                  // useRangeColorForAxis: true,
                  // ranges: [GaugeRange(startValue: double.parse(value), endValue: 100)],
                  pointers: <GaugePointer>[
                    RangePointer(
                        enableAnimation: true,
                        animationType: AnimationType.bounceOut,
                        value: value == null ? 0.0 : double.parse(value!),
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
                      value: value == null ? 0.0 : double.parse(value!),
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
