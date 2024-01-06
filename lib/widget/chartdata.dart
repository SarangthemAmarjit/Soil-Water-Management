import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialData extends StatelessWidget {
  final String nitro;
  final String phos;
  final String potas;
  const RadialData(
      {super.key,
      required this.nitro,
      required this.phos,
      required this.potas});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(nitro.isEmpty ? 'N/A' : 'Nitro',
          nitro.isEmpty ? 0 : int.parse(nitro)),
      ChartData(
          phos.isEmpty ? 'N/A' : 'Phosph', phos.isEmpty ? 0 : int.parse(phos)),
      ChartData(potas.isEmpty ? 'N/A' : 'Potas',
          potas.isEmpty ? 0 : int.parse(potas)),
    ];
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
          RadialBarSeries<ChartData, String>(
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
  final String x;
  final int y;
}
