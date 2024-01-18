import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/constant/gradient.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HumiditynTemp extends StatelessWidget {
  final String? value;
  final int index;
  const HumiditynTemp({
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
              enableLoadingAnimation: true,
              axes: <RadialAxis>[
                RadialAxis(
                  maximum: 100,

                  annotations: [
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            value == null
                                ? 'N/A'
                                : index == 0
                                    ? '$value%'
                                    : index == 1
                                        ? '$value°C'
                                        : value!,
                            style: TextStyle(
                              color: index == 0
                                  ? double.parse(value!) < 33.33
                                      ? Colors.red
                                      : Colors.black
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 20,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Card(
                            color: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                index == 0
                                    ? double.parse(value!) > 66.66
                                        ? 'Wet'
                                        : double.parse(value!) > 33.33
                                            ? 'Optimal'
                                            : 'Dry'
                                    : double.parse(value!) > 66.66
                                        ? 'High'
                                        : double.parse(value!) > 33.33
                                            ? 'Optimal'
                                            : 'Low',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                  ticksPosition: ElementsPosition.inside,
                  minimum: 0,

                  showLabels: true, // Show labels on the axis
                  labelOffset: 10, // Offset to adjust label position
                  ranges: <GaugeRange>[
                    index == 0
                        ? GaugeRange(
                            label: 'Dry',
                            labelStyle: const GaugeTextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            startValue: 0,
                            endValue: 33.33,
                            color: Colors.red.withOpacity(0.6),
                          )
                        : GaugeRange(
                            label: 'Low',
                            labelStyle: const GaugeTextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            startValue: 0,
                            endValue: 33.33,
                            color: Colors.blue.withOpacity(0.6),
                          ),
                    GaugeRange(
                      labelStyle: const GaugeTextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      label: 'Optimal',
                      startValue: 33.33,
                      endValue: 66.66,
                      color: Colors.green.withOpacity(0.6),
                    ),
                    index == 0
                        ? GaugeRange(
                            labelStyle: const GaugeTextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            label: 'Wet',
                            startValue: 66.66,
                            endValue: 100,
                            color: Colors.blue.withOpacity(0.7),
                          )
                        : GaugeRange(
                            labelStyle: const GaugeTextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            label: 'High',
                            startValue: 66.66,
                            endValue: 100,
                            color: Colors.red.withOpacity(0.7),
                          ),
                  ],
                  useRangeColorForAxis: true,

                  showTicks: true,
                  // useRangeColorForAxis: true,
                  // ranges: [GaugeRange(startValue: double.parse(value), endValue: 100)],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                        needleEndWidth: 4,
                        knobStyle: const KnobStyle(borderWidth: 2),
                        needleColor: const Color.fromARGB(255, 210, 86, 86),
                        enableAnimation: true,
                        animationDuration: 1500,
                        animationType: AnimationType.bounceOut,
                        value: double.parse(value!)),
                  ],
                ),
              ],
            ),
    );
  }
}
