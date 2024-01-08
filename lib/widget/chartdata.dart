import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialData extends StatelessWidget {
  final String? nitro;
  final String? phos;
  final String? potas;
  const RadialData({super.key, this.nitro, this.phos, this.potas});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    final List<ChartData> chartData = [
      ChartData(
          nitro == null ? 'N/A' : 'Nitro', nitro == null ? 0 : int.parse('4')),
      ChartData(
          phos == null ? 'N/A' : 'Phosph', phos == null ? 0 : int.parse('9')),
      ChartData(
          potas == null ? 'N/A' : 'Potas', potas == null ? 0 : int.parse('12')),
    ];
    log(nitro.toString());
    return SfCircularChart(
        legend: const Legend(
          itemPadding: 1,
          height: '22',
          iconHeight: 0,
          offset: Offset.zero,
          borderColor: Colors.amber,
          backgroundColor: Colors.white,
          isResponsive: true,
          position: LegendPosition.bottom,
          isVisible: true,
        ),
        series: <CircularSeries>[
          // Renders radial bar chart
          RadialBarSeries<ChartData, String?>(
              dataLabelSettings: const DataLabelSettings(
                  labelPosition: ChartDataLabelPosition.inside,
                  useSeriesColor: true,
                  showZeroValue: false,

                  // Renders the data label
                  isVisible: true),
              enableTooltip: true,
              radius: '115%',
              trackOpacity: 0.2,
              trackColor: Colors.grey,
              gap: '5%',
              cornerStyle: CornerStyle.bothCurve,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]);
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String? x;
  final int y;
}
