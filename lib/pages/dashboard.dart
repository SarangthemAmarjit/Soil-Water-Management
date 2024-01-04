import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 247, 249),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    color: Colors.white,
                    child: SfRadialGauge(
                      title: GaugeTitle(text: 'afafa'),
                      axes: <RadialAxis>[
                        RadialAxis(
                          showLabels: false,
                          showTicks: false,
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: 45,
                                width: 0.1,
                                sizeUnit: GaugeSizeUnit.factor,
                                cornerStyle: CornerStyle.startCurve,
                                gradient: const SweepGradient(colors: <Color>[
                                  Color(0xFF00a9b5),
                                  Color(0xFFa4edeb)
                                ], stops: <double>[
                                  0.25,
                                  0.75
                                ])),
                            MarkerPointer(
                              value: 45,
                              markerType: MarkerType.circle,
                              color: const Color(0xFF87e8e8),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
