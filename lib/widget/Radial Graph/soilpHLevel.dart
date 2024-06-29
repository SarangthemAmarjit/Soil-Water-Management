import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/constant/gradient.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialIndicatorSoil extends StatelessWidget {
  final String? value;

  const RadialIndicatorSoil({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    log(value.toString());
    GetxTapController controller = Get.put(GetxTapController());
    return Obx(
      () => controller.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : screenWidth > 800 && screenWidth < 1000
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      value == null || value!.isEmpty ? 'N/A' : '$value%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 50,
                      ),
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: SvgPicture.asset(
                        'assets/images/Soil Temperature Sensor.svg',
                      ),
                    ),
                  ],
                )
              : SfRadialGauge(
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(
                      maximum: 12,

                      annotations: [
                        GaugeAnnotation(
                            widget: Text(
                          value == null || value!.isEmpty
                              ? 'N/A'
                              : double.parse(value!) < 10
                                  ? '0$value'
                                  : value!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ))
                      ],

                      showLabels: true,
                      showTicks: true,
                      // useRangeColorForAxis: true,
                      // ranges: [GaugeRange(startValue: double.parse(value), endValue: 100)],
                      pointers: <GaugePointer>[
                        RangePointer(
                          enableAnimation: true,
                          animationType: AnimationType.bounceOut,
                          value: value == null || value!.isEmpty
                              ? 0.0
                              : double.parse(value!),
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          gradient: getPhLevelGradient(
                            value == null || value!.isEmpty
                                ? 0.0
                                : double.parse(value!),
                          ),
                        ),
                        MarkerPointer(
                          value: value == null || value!.isEmpty
                              ? 0.0
                              : double.parse(value!),
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
