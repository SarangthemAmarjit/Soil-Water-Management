import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:soilmoisturedetector/widget/drawerWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

@RoutePage()
class SoilNpkPage extends StatefulWidget {
  const SoilNpkPage({super.key});

  @override
  State<SoilNpkPage> createState() => _SoilNpkPageState();
}

class _SoilNpkPageState extends State<SoilNpkPage> {
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        zoomMode: ZoomMode.x,
        enableSelectionZooming: true,
        enableDoubleTapZooming: true);
    //   _trackballBehavior = TrackballBehavior(
    //   enable: true,
    //   // Display mode of trackball tooltip
    //   tooltipDisplayMode: TrackballDisplayMode.floatAllPoints
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    //!    from datetime import datetime
//! sales_data = datetime(2019, 1, 1, 12, 34)  # Year: 2019, Month: 1, Day: 1, Hour: 12, Minute: 34

    final List<SoilNPK> chartData = [
      SoilNPK(DateTime(2024, 1, 1, 01, 00), 10, 20, 30),
      SoilNPK(DateTime(2024, 1, 1, 02, 00), 20, 33, 44),
      SoilNPK(DateTime(2024, 1, 1, 03, 00), 34, 54, 43),
      SoilNPK(DateTime(2024, 1, 1, 04, 00), 34, 43, 21),
      SoilNPK(DateTime(2024, 1, 1, 05, 00), 67, 43, 54),
      SoilNPK(DateTime(2024, 1, 1, 06, 00), 76, 43, 56),
      SoilNPK(DateTime(2024, 1, 1, 07, 00), 56, 56, 54),
      SoilNPK(DateTime(2024, 1, 1, 08, 00), 43, 43, 34),
      SoilNPK(DateTime(2024, 1, 1, 09, 00), 56, 32, 21)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text(
          "Soil N P K",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
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
                                zoomPanBehavior: _zoomPanBehavior,
                                primaryXAxis: const DateTimeAxis(),
                                series: <CartesianSeries>[
                              // Renders line chart
                              LineSeries<SoilNPK, DateTime>(
                                  legendItemText: "Nitrogen",
                                  color: Colors.red,
                                  dataSource: chartData,

                                  //  List.generate(
                                  //   controller.isselectedmonthly
                                  //       ? controller.monthdatalist ==
                                  //                   null ||
                                  //               controller
                                  //                   .monthdatalist!
                                  //                   .isEmpty
                                  //           ? 0
                                  //           : months.length
                                  //       : controller.yearlist.length,
                                  //   (index) => ChartData(
                                  //       controller.isselectedmonthly
                                  //           ? months[index]
                                  //           : controller
                                  //               .yearlist[index]
                                  //               .toString(),
                                  //       controller.isselectedmonthly
                                  //           ? controller
                                  //               .monthdatalist![index]
                                  //           : controller
                                  //               .datalist[index]),
                                  // ),
                                  xValueMapper: (SoilNPK sales, _) =>
                                      sales.year,
                                  yValueMapper: (SoilNPK N, _) => N.N),
                              LineSeries<SoilNPK, DateTime>(
                                  animationDelay: 300,
                                  color: Colors.green,
                                  legendItemText: "Phosphorous",
                                  dataSource: chartData,
                                  xValueMapper: (SoilNPK sales, _) =>
                                      sales.year,
                                  yValueMapper: (SoilNPK P, _) => P.P),
                              LineSeries<SoilNPK, DateTime>(
                                  animationDelay: 600,
                                  color: Colors.blue,
                                  legendItemText: "Potassium",
                                  dataSource: chartData,
                                  xValueMapper: (SoilNPK sales, _) =>
                                      sales.year,
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
                      height: screenheight / 2,
                      child: Center(
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
                                  padding: const EdgeInsets.only(right: 8.0),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
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
                                          horizontal: screenWidth / 30.0,
                                          vertical: screenWidth / 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                fontSize: screenWidth / 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.red,
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'N',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              screenWidth / 26,
                                                          color: Colors.white)),
                                                  // const TextSpan(text: 'itrogen'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.green,
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'P',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              screenWidth / 26,
                                                          color: Colors.white)),
                                                  // const TextSpan(
                                                  //     text: 'hosporous'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.blue,
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'K',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              screenWidth / 26,
                                                          color: Colors.white)),
                                                  // const TextSpan(
                                                  //     text: 'otassium'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: index % 2 == 0
                                                  ? Colors.blueGrey[100]
                                                  : Colors.grey[100],
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "00.0$index",
                                                  style: TextStyle(
                                                      color: index % 2 == 1
                                                          ? Colors.black
                                                          : Colors.black,
                                                      fontSize:
                                                          screenWidth / 26),
                                                ),
                                                Text(
                                                  "N$index",
                                                  style: TextStyle(
                                                      color: index % 2 == 1
                                                          ? Colors.black
                                                          : Colors.blueGrey,
                                                      fontSize:
                                                          screenWidth / 26),
                                                ),
                                                Text(
                                                  "P$index",
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
                                                    "K$index",
                                                    style: TextStyle(
                                                        color: index % 2 == 1
                                                            ? Colors.black
                                                            : Colors.blueGrey,
                                                        fontSize:
                                                            screenWidth / 26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
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
}

class SoilNPK {
  SoilNPK(this.year, this.N, this.P, this.K);
  final DateTime year;
  final double N;
  final double P;
  final double K;
}
