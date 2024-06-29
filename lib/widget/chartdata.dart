import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialData extends StatelessWidget {
  final String? nitro;
  final String? phos;
  final String? potas;
  const RadialData(
      {super.key,
      required this.nitro,
      required this.phos,
      required this.potas});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.033;
    GetxTapController controller = Get.put(GetxTapController());
    final List<ChartData> chartData = [
      ChartData(
        nitro == null || nitro!.isEmpty ? 'N/A ' : 'N',
        nitro == null || nitro!.isEmpty ? 0 : int.parse(nitro!),
      ),
      ChartData(
        phos == null || phos!.isEmpty ? 'N/A ' : 'p',
        phos == null || phos!.isEmpty ? 0 : int.parse(phos!),
      ),
      ChartData(
        potas == null || potas!.isEmpty ? 'N/A ' : 'K',
        potas == null || potas!.isEmpty ? 0 : int.parse(potas!),
      ),
    ];

    return screenWidth > 800 && screenWidth < 1000
        ? Stack(
            alignment: Alignment.center,
            children: [
              FittedBox(
                child: Column(
                  children: [
                    Text(
                      nitro == null || nitro!.isEmpty ? 'N : N/A' : 'N :$nitro',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 55,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      nitro == null || nitro!.isEmpty ? 'P : N/A' : 'P :$nitro',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 55,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      nitro == null || nitro!.isEmpty ? 'K : N/A' : 'K :$nitro',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 55,
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.3,
                child: SvgPicture.asset(
                  'assets/images/Soil NPK Sensor.svg',
                ),
              ),
            ],
          )
        : SfCircularChart(
            tooltipBehavior: TooltipBehavior(enable: true),
            legend: Legend(
              padding: 3,
              toggleSeriesVisibility: true,
              iconWidth: nitro == null || nitro!.isEmpty ? 2 : 25,
              itemPadding: 10,
              height: '30',
              iconHeight: 10,
              offset: Offset.zero,
              borderColor: Colors.amber,
              backgroundColor: Colors.white,
              isResponsive: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
              isVisible: true,
            ),
            series: <CircularSeries>[
              // Renders radial bar chart
              RadialBarSeries<ChartData, String?>(
                enableTooltip: true,
                radius: '115%',
                trackOpacity: 0.2,
                trackColor: Colors.grey,
                gap: '7%',
                cornerStyle: CornerStyle.bothCurve,
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              ),
            ],
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: chartData.map((data) {
                      return Text(
                        '${data.x}: ${data.y}%',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
  );
  final String? x;
  final int y;
}
