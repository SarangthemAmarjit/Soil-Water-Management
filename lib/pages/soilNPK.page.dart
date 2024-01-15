import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SoilNpkPage extends StatelessWidget {
  SoilNpkPage({super.key});

  late ZoomPanBehavior _zoomPanBehavior;

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

  List<Map<String, double>> soilNPK = [
    {'Nitrogen': 1.0, 'Phosphorous': 2.0, 'Potassium': 3.0},
    {'Nitrogen': 4.5, 'Phosphorous': 6.7, 'Potassium': 8.2},
    {'Nitrogen': 0.2, 'Phosphorous': 9.1, 'Potassium': 5.5},
    {'Nitrogen': 1.0, 'Phosphorous': 2.0, 'Potassium': 3.0},
    {'Nitrogen': 4.5, 'Phosphorous': 6.7, 'Potassium': 8.2},
    {'Nitrogen': 0.2, 'Phosphorous': 9.1, 'Potassium': 5.5},
    {'Nitrogen': 1.0, 'Phosphorous': 2.0, 'Potassium': 3.0},
    {'Nitrogen': 4.5, 'Phosphorous': 6.7, 'Potassium': 8.2},
    {'Nitrogen': 0.2, 'Phosphorous': 9.1, 'Potassium': 5.5},
    {'Nitrogen': 1.0, 'Phosphorous': 2.0, 'Potassium': 3.0},
    {'Nitrogen': 4.5, 'Phosphorous': 6.7, 'Potassium': 8.2},
    {'Nitrogen': 0.2, 'Phosphorous': 9.1, 'Potassium': 5.5},
    // Add more maps as needed
  ];

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    //!    from datetime import datetime
//! soilnpk_data = datetime(2019, 1, 1, 12, 34)  # time: 2019, Month: 1, Day: 1, Hour: 12, Minute: 34

    // final List<SoilNPK> chartData = [
    //   SoilNPK(DateTime(2024, 1, 1, 01, 00), 10, 20, 30),
    //   SoilNPK(DateTime(2024, 1, 1, 02, 00), 20, 33, 44),
    //   SoilNPK(DateTime(2024, 1, 1, 03, 00), 34, 54, 43),
    //   SoilNPK(DateTime(2024, 1, 1, 04, 00), 34, 43, 21),
    //   SoilNPK(DateTime(2024, 1, 1, 05, 00), 67, 43, 54),
    //   SoilNPK(DateTime(2024, 1, 1, 06, 00), 76, 43, 56),
    //   SoilNPK(DateTime(2024, 1, 1, 07, 00), 56, 56, 54),
    //   SoilNPK(DateTime(2024, 1, 1, 08, 00), 43, 43, 34),
    //   SoilNPK(DateTime(2024, 1, 1, 09, 00), 56, 32, 21)
    // ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 242, 226),
        title: Text(
          "Soil N P K",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth / 20,
            fontWeight: FontWeight.bold,
            shadows: const <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
                color: Colors.green,
              ),
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 3.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      // drawer: const drawerWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: screenheight,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.7), BlendMode.dstATop),
                image: const AssetImage(
                  "assets/images/BGspray.png",
                ),
                // opacity: .2,
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenheight / 82,
                  ),
                  Opacity(
                    opacity: .9,
                    child: Container(
                        color: Colors.white,
                        height: screenheight / 3,
                        child: Center(
                            child: SfCartesianChart(
                                legend: const Legend(
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

                                  // chartData,

                                  //  List.generate(
                                  //   controller.isselectedmonthly
                                  //       ? controller.monthdatalist ==
                                  //                   null ||
                                  //               controller
                                  //                   .monthdatalist!
                                  //                   .isEmpty
                                  //           ? 0
                                  //           : months.length
                                  //       : controller.timelist.length,
                                  //   (index) => ChartData(
                                  //       controller.isselectedmonthly
                                  //           ? months[index]
                                  //           : controller
                                  //               .timelist[index]
                                  //               .toString(),
                                  //       controller.isselectedmonthly
                                  //           ? controller
                                  //               .monthdatalist![index]
                                  //           : controller
                                  //               .datalist[index]),
                                  // ),
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
                  SizedBox(
                    height: screenheight / 82,
                  ),
                  Opacity(
                    opacity: .8,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      // color: Colors.white,
                      height: screenheight / 1.85,
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenheight / 82,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.history,
                                        size: screenWidth / 20,
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
                                              fontSize: screenWidth / 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenheight / 82,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Container(
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
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: screenheight / 108,
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              decoration: BoxDecoration(
                                                  color: Colors.orange[200],
                                                  borderRadius:
                                                      const BorderRadius
                                                          .vertical(
                                                          top: Radius.circular(
                                                              14))),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidth / 30.0,
                                                  vertical: screenWidth / 30),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Time",
                                                    style: TextStyle(
                                                        fontSize:
                                                            screenWidth / 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 6),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Colors.red,
                                                    ),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: 'N',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      screenWidth /
                                                                          26,
                                                                  color: Colors
                                                                      .white)),
                                                          // const TextSpan(text: 'itrogen'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 6),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Colors.green,
                                                    ),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: 'P',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      screenWidth /
                                                                          26,
                                                                  color: Colors
                                                                      .white)),
                                                          // const TextSpan(
                                                          //     text: 'hosporous'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 6),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Colors.blue,
                                                    ),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: 'K',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      screenWidth /
                                                                          26,
                                                                  color: Colors
                                                                      .white)),
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
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount: 10,
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
                                                        vertical: 12,
                                                        horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      DateFormat('h:mm a')
                                                          .format(controller
                                                                  .alldatetimelast10[
                                                              index]),
                                                      style: TextStyle(
                                                          color: index % 2 == 1
                                                              ? Colors.black
                                                              : Colors.black,
                                                          fontSize:
                                                              screenWidth / 26),
                                                    ),
                                                    Text(
                                                      "${controller.allsoildatamaplast10[index]['field5'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field4']}",
                                                      style: TextStyle(
                                                          color: index % 2 == 1
                                                              ? Colors.black
                                                              : Colors.blueGrey,
                                                          fontSize:
                                                              screenWidth / 26),
                                                    ),
                                                    Text(
                                                      "${controller.allsoildatamaplast10[index]['field5'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field5']}",
                                                      style: TextStyle(
                                                          color: index % 2 == 1
                                                              ? Colors.black
                                                              : Colors.blueGrey,
                                                          fontSize:
                                                              screenWidth / 26),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 12.0),
                                                      child: Text(
                                                        "${controller.allsoildatamaplast10[index]['field5'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field6']}",
                                                        style: TextStyle(
                                                            color: index % 2 ==
                                                                    1
                                                                ? Colors.black
                                                                : Colors
                                                                    .blueGrey,
                                                            fontSize:
                                                                screenWidth /
                                                                    26),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenheight / 64,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<SoilNPK> _getData({required GetxTapController controller}) {
    List<SoilNPK> data = [];
    for (int i = 0; i < controller.alldatetime.length; i++) {
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
