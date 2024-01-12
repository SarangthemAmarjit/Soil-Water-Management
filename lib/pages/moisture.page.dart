import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:soilmoisturedetector/widget/drawerWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// TODO: to change the page name

@RoutePage()
class CommonGraphPage extends StatefulWidget {
  final List<double> graphYaxisdata;
  const CommonGraphPage({super.key, required this.graphYaxisdata});

  @override
  State<CommonGraphPage> createState() => _CommonGraphPageState();
}

class _CommonGraphPageState extends State<CommonGraphPage> {
  late ZoomPanBehavior _zoomPanBehavior;
  final List<DateTime> DateData = [
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

  final List<double> moistureData = [
    23,
    22,
    22,
    23,
    10,
    22,
    77,
    33,
    44,
    25,
    18,
    23,
  ];

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
    double screenwidth = MediaQuery.of(context).size.width;

//!    from datetime import datetime
//! sales_data = datetime(2019, 1, 1, 12, 34)  # Year: 2019, Month: 1, Day: 1, Hour: 12, Minute: 34

    // final List<Moisture> moisturChartData = [
    //   Moisture(DateTime(2024, 1, 1, 01, 00), 76),
    //   Moisture(DateTime(2024, 1, 1, 02, 00), 56),
    //   Moisture(DateTime(2024, 1, 1, 03, 00), 43),
    //   Moisture(DateTime(2024, 1, 1, 04, 00), 21),
    //   Moisture(DateTime(2024, 1, 1, 07, 00), 56),
    //   Moisture(DateTime(2024, 1, 1, 08, 00), 87),
    //   Moisture(DateTime(2024, 1, 1, 09, 00), 65),
    //   Moisture(DateTime(2024, 1, 1, 10, 00), 21),
    //   Moisture(DateTime(2024, 1, 1, 11, 00), 34),
    //   Moisture(DateTime(2024, 1, 1, 12, 00), 67),
    // ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 242, 226),
        title: Text(
          "Soil Moisture",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenwidth / 20,
            fontWeight: FontWeight.bold,
            shadows: const <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
                color: Colors.black,
              ),
              // Shadow(
              //   offset: Offset(3.0, 3.0),
              //   blurRadius: 3.0,
              //   color: Colors.black,
              // ),
            ],
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: BackButton(),
          ),
        ],
      ),
      drawer: const drawerWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1), BlendMode.dstATop),
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
                                zoomPanBehavior: _zoomPanBehavior,
                                primaryXAxis: const DateTimeAxis(),
                                series: <CartesianSeries>[
                              // Renders line chart
                              LineSeries<Moisture, DateTime>(
                                  markerSettings:
                                      const MarkerSettings(isVisible: true),
                                  dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                      labelPosition:
                                          ChartDataLabelPosition.inside),
                                  dataSource:

                                      //! above codes to be used for dateTime
                                      // moisturChartData,
                                      _getData(),
                                  xValueMapper: (Moisture moisture, _) =>
                                      moisture.time,
                                  yValueMapper: (Moisture moisture, _) =>
                                      moisture.moisture)
                            ]))),
                  ),
                  SizedBox(
                    height: screenheight / 82,
                  ),
                  Opacity(
                    opacity: .8,
                    child: Container(
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
                                  size: screenwidth / 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "HISTORY",
                                    style: TextStyle(
                                        fontSize: screenwidth / 20,
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
                                          horizontal: screenwidth / 20.0,
                                          vertical: screenwidth / 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                fontSize: screenwidth / 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Moisture Level",
                                            style: TextStyle(
                                                fontSize: screenwidth / 24,
                                                fontWeight: FontWeight.bold),
                                          )
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
                                            child: ListTile(
                                                // leading: Icon(
                                                //   Icons.av_timer,
                                                //   size: screenwidth / 32,
                                                // ),
                                                trailing: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 6.0),
                                                  child: Text(
                                                    "sample $index",
                                                    style: TextStyle(
                                                        color: index % 2 == 1
                                                            ? Colors.black
                                                            : Colors.black,
                                                        fontSize:
                                                            screenwidth / 26),
                                                  ),
                                                ),
                                                title: Text(
                                                  "00:0$index",
                                                  style: TextStyle(
                                                      color: index % 2 == 1
                                                          ? Colors.black
                                                          : Colors.black,
                                                      fontSize:
                                                          screenwidth / 26),
                                                )),
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

  List<Moisture> _getData() {
    List<Moisture> data = [];
    for (int i = 0; i < DateData.length; i++) {
      data.add(Moisture(DateData[i], moistureData[i]));
    }
    return data;
  }
}

class Moisture {
  Moisture(this.time, this.moisture);
  final DateTime time;
  final double moisture;
}
