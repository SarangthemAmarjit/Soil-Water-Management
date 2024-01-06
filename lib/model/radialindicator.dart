import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialIndicatorSoil extends StatelessWidget {
  final String value;

  const RadialIndicatorSoil({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          annotations: [
            GaugeAnnotation(
                widget: Text(
              value.isEmpty ? 'N/A' : '$value%',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ))
          ],
          showLabels: false,
          showTicks: false,
          useRangeColorForAxis: true,
          ranges: [GaugeRange(startValue: double.parse(value), endValue: 100)],
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
    );
  }
}
