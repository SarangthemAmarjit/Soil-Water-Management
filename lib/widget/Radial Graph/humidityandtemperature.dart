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
    double screenwidth = MediaQuery.of(context).size.width;
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
                            height: 20,
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
                         
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 25,
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: SizedBox(
                                width: screenwidth / 8,
                                child: Center(
                                  child: Text(
    value==null||value!.isEmpty?'N/A':
                                    index == 0
                                        ? 
                                    
                                        double.parse(value!) > 66.66
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
                                          MediaQuery.of(context).size.width /
                                              30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                            gradient: SweepGradient(
                              colors: <Color>[
                                Colors.red.withOpacity(0.9),
                                Colors.red.withOpacity(0.5),
                              ],
                            ),
                            label: 'Dry',
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'KulimPark',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            startValue: 0,
                            endValue: 33.33,
                          )
                        : GaugeRange(
                            gradient: SweepGradient(
                              colors: <Color>[
                                Colors.blue.withOpacity(0.9),
                                Colors.blue.withOpacity(0.5),
                              ],
                            ),
                            label: 'Low',
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'KulimPark',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            startValue: 0,
                            endValue: 33.33,
                          ),
                    GaugeRange(
                      color: Colors.green.withOpacity(0.9),
                      labelStyle: const GaugeTextStyle(
                          fontFamily: 'KulimPark',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      label: 'Optimal',
                      startValue: 33.33,
                      endValue: 66.66,
                    ),
                    index == 0
                        ? GaugeRange(
                            gradient: SweepGradient(
                              colors: <Color>[
                                Colors.blue.withOpacity(0.5),
                                Colors.blue.withOpacity(0.9),
                              ],
                            ),
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'KulimPark',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            label: 'Wet',
                            startValue: 66.66,
                            endValue: 100,
                          )
                        : GaugeRange(
                            gradient: SweepGradient(
                              colors: <Color>[
                                Colors.red.withOpacity(0.5),
                                Colors.red.withOpacity(0.9),
                              ],
                            ),
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'KulimPark',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            label: 'High',
                            startValue: 66.66,
                            endValue: 100,
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
                        value: value==null||value!.isEmpty?0.0: double.parse(value!)),
                  ],
                ),
              ],
            ),
    );
  }
}
