import 'dart:developer';

import 'package:flutter/material.dart';
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
      ChartData(nitro == null || nitro!.isEmpty ? 'N/A ' : 'N',
          nitro == null || nitro!.isEmpty ? 0 : int.parse(nitro!)),
      ChartData(phos == null || phos!.isEmpty ? 'N/A ' : 'p',
          phos == null || phos!.isEmpty ? 0 : int.parse(phos!)),
      ChartData(potas == null || potas!.isEmpty ? 'N/A ' : 'K',
          potas == null || potas!.isEmpty ? 0 : int.parse(potas!)),
    ];

    return SfCircularChart(
      tooltipBehavior: TooltipBehavior(enable: true),
      legend: Legend(
        toggleSeriesVisibility: true,
        iconWidth: nitro == null || nitro!.isEmpty ? 2 : 20,
        itemPadding: 2,
        height: '30',
        iconHeight: 0,
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
          dataLabelSettings: const DataLabelSettings(
              useSeriesColor: true,
              borderColor: Colors.yellow,
              labelAlignment: ChartDataLabelAlignment.bottom,
              labelPosition: ChartDataLabelPosition.inside,
              overflowMode: OverflowMode.trim,

              // Renders the data label
              isVisible: true),
          enableTooltip: true,
          radius: '100%',
          trackOpacity: 0.2,
          trackColor: Colors.grey,
          gap: '5%',
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
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
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
  ChartData(this.x, this.y);
  final String? x;
  final int y;
}
