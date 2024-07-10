import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
@RoutePage()
class WebSoilNpkPage extends StatelessWidget {
  WebSoilNpkPage({super.key});

  final List<DateTime> dateData = [
    DateTime(2024, 1, 1, 1, 00),
    DateTime(2024, 1, 1, 2, 00),
    DateTime(2024, 1, 1, 3, 00),
    DateTime(2024, 1, 1, 4, 00),
    DateTime(2024, 1, 1, 5, 00),
    DateTime(2024, 1, 1, 6, 00),
    DateTime(2024, 1, 1, 7, 00),
    DateTime(2024, 1, 1, 8, 00),
    DateTime(2024, 1, 1, 9, 00),
    DateTime(2024, 1, 1, 10, 00),
    DateTime(2024, 1, 1, 11, 00),
    DateTime(2024, 1, 1, 12, 00),

    // Add more DateTime values as needed
  ];

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 50, top: 20),
            child: Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    color: Colors.white,
                    height: screenheight / 3,
                    child: Center(
                        child: SfCartesianChart(
                            legend: const Legend(
                              position: LegendPosition.top,
                              isResponsive: true,
                              isVisible: true,
                            ),
                            zoomPanBehavior: controller.zoomPanBehavior,
                            primaryXAxis: const DateTimeAxis(
                                autoScrollingMode: AutoScrollingMode.end,
                                initialZoomPosition: 1,
                                initialZoomFactor: 0.01),
                            series: <CartesianSeries>[
                          // Renders line chart
                          LineSeries<SoilNPK, DateTime>(
                              legendItemText: "Nitrogen",
                              color: Colors.red,
                              dataSource: _getData(controller: controller),
                              xValueMapper: (SoilNPK soilnpk, _) =>
                                  soilnpk.time,
                              yValueMapper: (SoilNPK N, _) => N.N),
                          LineSeries<SoilNPK, DateTime>(
                              animationDelay: 300,
                              color: Colors.green,
                              legendItemText: "Phosphorous",
                              dataSource: _getData(controller: controller),
                              //  chartData,
                              xValueMapper: (SoilNPK soilnpk, _) =>
                                  soilnpk.time,
                              yValueMapper: (SoilNPK P, _) => P.P),
                          LineSeries<SoilNPK, DateTime>(
                              animationDelay: 600,
                              color: Colors.blue,
                              legendItemText: "Potassium",
                              dataSource: _getData(controller: controller),
                              //  chartData,
                              xValueMapper: (SoilNPK soilnpk, _) =>
                                  soilnpk.time,
                              yValueMapper: (SoilNPK K, _) => K.K)
                        ]))),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 50, top: 20),
            child: Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // color: Colors.white,
                  height: screenheight / 1.95,
                  child: Center(
                    child: Column(
                      children: [
                        FittedBox(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.history,
                                      size: screenWidth / 40,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        "HISTORY",
                                        style: TextStyle(
                                            fontSize: screenWidth / 50,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenheight / 82,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.orange,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              // height: 40,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: screenheight / 108,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.orange[200],
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    top: Radius.circular(14))),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth / 60,
                                            vertical: screenWidth / 60),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Time",
                                              style: TextStyle(
                                                  fontSize: screenWidth / 50,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.red,
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'N',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                screenWidth /
                                                                    50,
                                                            color:
                                                                Colors.white)),
                                                    // const TextSpan(text: 'itrogen'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.green,
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'P',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                screenWidth /
                                                                    50,
                                                            color:
                                                                Colors.white)),
                                                    // const TextSpan(
                                                    //     text: 'hosporous'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.blue,
                                              ),
                                              child: RichText(
                                                text: TextSpan(
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'K',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                screenWidth /
                                                                    50,
                                                            color:
                                                                Colors.white)),
                                                    // const TextSpan(
                                                    //     text: 'otassium'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: controller
                                              .allsoildatamaplast10.length,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              margin: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: index % 2 == 0
                                                    ? Colors.blueGrey[100]
                                                    : Colors.grey[100],
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    DateFormat('h:mm a').format(
                                                        controller
                                                                .alldatetimelast10[
                                                            index]),
                                                    style: TextStyle(
                                                        color: index % 2 == 1
                                                            ? Colors.black
                                                            : Colors.black,
                                                        fontSize:
                                                            screenWidth / 45),
                                                  ),
                                                  Text(
                                                    "${controller.allsoildatamaplast10[index]['field4'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field4']}",
                                                    style: TextStyle(
                                                        color: index % 2 == 1
                                                            ? Colors.black
                                                            : Colors.blueGrey,
                                                        fontSize:
                                                            screenWidth / 45),
                                                  ),
                                                  Text(
                                                    "${controller.allsoildatamaplast10[index]['field5'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field5']}",
                                                    style: TextStyle(
                                                        color: index % 2 == 1
                                                            ? Colors.black
                                                            : Colors.blueGrey,
                                                        fontSize:
                                                            screenWidth / 45),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 12.0),
                                                    child: Text(
                                                      "${controller.allsoildatamaplast10[index]['field6'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field6']}",
                                                      style: TextStyle(
                                                          color: index % 2 == 1
                                                              ? Colors.black
                                                              : Colors.blueGrey,
                                                          fontSize:
                                                              screenWidth / 45),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenheight / 64,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: screenheight / 64,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  List<SoilNPK> _getData({required GetxTapController controller}) {
    List<SoilNPK> data = [];
    for (int i = 0; i < controller.allsoildatamap.length; i++) {
      data.add(SoilNPK(
          controller.alldatetime[i],
          controller.allsoildatamap[i]['field4'].toString().isEmpty
              ? 0
              : double.parse(controller.allsoildatamap[i]['field4']),
          controller.allsoildatamap[i]['field5'].toString().isEmpty
              ? 0
              : double.parse(controller.allsoildatamap[i]['field5']),
          controller.allsoildatamap[i]['field6'].toString().isEmpty
              ? 0
              : double.parse(controller.allsoildatamap[i]['field6'])));
    }
    return data;
  }
}

class SoilNPK {
  SoilNPK(this.time, this.N, this.P, this.K);
  final DateTime time;
  final double N;
  final double P;
  final double K;
}
