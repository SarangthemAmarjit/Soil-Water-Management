import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class VerticalLinearGauge extends StatelessWidget {
  final String N;
  final String P;
  final String K;
  final String temp;
  final String humi;
  final String phlevel;
  const VerticalLinearGauge(
      {super.key,
      required this.N,
      required this.P,
      required this.K,
      required this.temp,
      required this.humi,
      required this.phlevel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 10,
        child: FittedBox(
          child: Row(
            children: <Widget>[
              LinearGaugeWidget(
                title: 'Soil Humidity',
                value: humi.isEmpty ? 0 : double.parse(humi),
                unit: '%',
                status: 'Wet',
                ranges: const [
                  LinearGaugeRange(
                      startValue: 0, endValue: 20, color: Colors.red),
                  LinearGaugeRange(
                      startValue: 20, endValue: 60, color: Colors.green),
                  LinearGaugeRange(
                      startValue: 60, endValue: 100, color: Colors.blue),
                ],
                min: 0,
                max: 100,
              ),
              LinearGaugeWidget(
                title: 'Soil Temperature',
                value: temp.isEmpty ? 0 : double.parse(temp),
                unit: '°C',
                status: 'Low',
                ranges: const [
                  LinearGaugeRange(
                      startValue: 0, endValue: 15, color: Colors.blue),
                  LinearGaugeRange(
                      startValue: 15, endValue: 35, color: Colors.green),
                  LinearGaugeRange(
                      startValue: 35, endValue: 50, color: Colors.red),
                ],
                min: 0,
                max: 50,
              ),
              LinearGaugeWidget(
                title: 'Soil pH Level',
                value: phlevel.isEmpty ? 0 : double.parse(phlevel),
                unit: 'pH',
                status: 'Neutral',
                ranges: const [
                  LinearGaugeRange(
                      startValue: 0, endValue: 16, color: Colors.red),
                  LinearGaugeRange(
                      startValue: 16, endValue: 33, color: Colors.green),
                  LinearGaugeRange(
                      startValue: 33, endValue: 50, color: Colors.red),
                ],
                min: 0,
                max: 50,
              ),
              Row(
                children: [
                  LinearGaugeWidget(
                    title: 'N',
                    value: N.isEmpty ? 0 : double.parse(N),
                    unit: 'NPK',
                    status: 'Optimal',
                    ranges: const [
                      LinearGaugeRange(
                          startValue: 0, endValue: 30, color: Colors.red),
                      LinearGaugeRange(
                          startValue: 30, endValue: 70, color: Colors.yellow),
                      LinearGaugeRange(
                          startValue: 70, endValue: 100, color: Colors.green),
                    ],
                    min: 0,
                    max: 100,
                  ),
                  LinearGaugeWidget(
                    title: 'P',
                    value: P.isEmpty ? 0 : double.parse(P),
                    unit: 'NPK',
                    status: 'Optimal',
                    ranges: const [
                      LinearGaugeRange(
                          startValue: 0, endValue: 30, color: Colors.red),
                      LinearGaugeRange(
                          startValue: 30, endValue: 70, color: Colors.yellow),
                      LinearGaugeRange(
                          startValue: 70, endValue: 100, color: Colors.green),
                    ],
                    min: 0,
                    max: 100,
                  ),
                  LinearGaugeWidget(
                    title: 'K',
                    value: K.isEmpty ? 0 : double.parse(K),
                    unit: 'NPK',
                    status: 'Optimal',
                    ranges: const [
                      LinearGaugeRange(
                          startValue: 0, endValue: 30, color: Colors.red),
                      LinearGaugeRange(
                          startValue: 30, endValue: 70, color: Colors.yellow),
                      LinearGaugeRange(
                          startValue: 70, endValue: 100, color: Colors.green),
                    ],
                    min: 0,
                    max: 100,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LinearGaugeWidget extends StatelessWidget {
  final String title;
  final double value;
  final String unit;
  final String status;
  final double min;
  final double max;
  final List<LinearGaugeRange> ranges;

  const LinearGaugeWidget({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.status,
    required this.ranges,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: SfLinearGauge(
                  barPointers: [
                    LinearBarPointer(
                      value: value,
                      thickness: 5, // Adjust the thickness of the bar here
                      color: Colors.blue,
                    ),
                  ],
                  orientation: LinearGaugeOrientation.vertical,
                  minimum: min,
                  maximum: max,
                  animateRange: true,
                  ranges: ranges,
                  markerPointers: [
                    LinearShapePointer(
                      value: value,
                      shapeType: LinearShapePointerType.circle,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
