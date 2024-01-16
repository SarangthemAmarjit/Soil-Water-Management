import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SfRadialGauge with Labels'),
        ),
        body: Center(
          child: SizedBox(
            height: 300,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  annotations: const [
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '65%',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Moderate',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    )
                  ],
                  ticksPosition: ElementsPosition.inside,
                  minimum: 0,
                  maximum: 100,
                  showLabels: true, // Show labels on the axis
                  labelOffset: 10, // Offset to adjust label position
                  ranges: <GaugeRange>[
                    GaugeRange(
                      label: 'Low',
                      labelStyle: const GaugeTextStyle(color: Colors.black),
                      startValue: 0,
                      endValue: 33.33,
                      color: Colors.red.withOpacity(0.5),
                    ),
                    GaugeRange(
                      labelStyle: const GaugeTextStyle(color: Colors.black),
                      label: 'Medium',
                      startValue: 33.33,
                      endValue: 66.66,
                      color: Colors.yellow.withOpacity(0.5),
                    ),
                    GaugeRange(
                      labelStyle: const GaugeTextStyle(color: Colors.black),
                      label: 'High',
                      startValue: 66.66,
                      endValue: 100,
                      color: Colors.blue.withOpacity(0.5),
                    ),
                  ],
                  pointers: const <GaugePointer>[
                    NeedlePointer(
                      enableAnimation: true,
                      animationDuration: 1500,
                      animationType: AnimationType.bounceOut,
                      value: 65.0,
                    ),
                    MarkerPointer(
                      value: 65,
                      overlayColor: Colors.amber,
                      markerType: MarkerType.circle,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
