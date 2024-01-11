//! string as axis

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:soilmoisturedetector/widget/drawerWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

//TODO: to change the page name

@RoutePage()
class MoisturePage extends StatelessWidget {
  const MoisturePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    List<_SalesData> data = [
      _SalesData('Mon', 35),
      _SalesData('Tue', 28),
      _SalesData('Wed', 34),
      _SalesData('Thu', 32),
      _SalesData('Fri', 40),
      _SalesData('Sat', 32),
      _SalesData('Sun', 20)
    ];

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
                      height: screenheight / 2,
                      child: Center(
                        child: Column(children: [
                          //Initialize the chart widget
                          SfCartesianChart(
                              enableAxisAnimation: false,
                              primaryXAxis: const CategoryAxis(),

                              // Chart title
                              title: const ChartTitle(
                                  text: 'Moisture Level Chart'),
                              // Enable legend
                              legend: const Legend(isVisible: false),
                              // Enable tooltip
                              tooltipBehavior: TooltipBehavior(enable: false),

                              //todo marker:
                              annotations: const [
                                CartesianChartAnnotation(
                                    widget: Icon(Icons.golf_course_sharp),
                                    x: 460,
                                    y: 40)
                              ],
                              series: <CartesianSeries<_SalesData, String>>[
                                LineSeries<_SalesData, String>(
                                    dataSource: data,
                                    xValueMapper: (_SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (_SalesData sales, _) =>
                                        sales.sales,
                                    name: 'Moisture',
                                    // Enable data label
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true))
                              ]),

                          //todo-->
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              //Initialize the spark charts widget
                              child: SfSparkLineChart.custom(
                                //Enable the trackball
                                trackball: const SparkChartTrackball(
                                    activationMode:
                                        SparkChartActivationMode.tap),
                                //Enable marker
                                marker: const SparkChartMarker(
                                    displayMode:
                                        SparkChartMarkerDisplayMode.all),
                                //Enable data label
                                labelDisplayMode:
                                    SparkChartLabelDisplayMode.all,
                                xValueMapper: (int index) => data[index].year,
                                yValueMapper: (int index) => data[index].sales,
                                dataCount: 5,
                              ),
                            ),
                          )
                        ]),
                        // child: Text(
                        //   "GRAPH",
                        //   style: TextStyle(fontSize: 98),
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight / 82,
                  ),
                  Opacity(
                    opacity: .5,
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
                                  size: screenwidth / 12,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "HISTORY",
                                    style: TextStyle(
                                        fontSize: screenwidth / 12,
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
                                      height: screenheight / 82,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                fontSize: screenwidth / 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Moisture Level",
                                            style: TextStyle(
                                                fontSize: screenwidth / 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                              leading:
                                                  const Icon(Icons.av_timer),
                                              trailing: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 28.0),
                                                child: Text(
                                                  "sample $index",
                                                  style: TextStyle(
                                                      color: index % 2 == 1
                                                          ? Colors.black
                                                          : Colors.blueGrey,
                                                      fontSize:
                                                          screenwidth / 20),
                                                ),
                                              ),
                                              title: Text(
                                                "00:0$index",
                                                style: TextStyle(
                                                    color: index % 2 == 1
                                                        ? Colors.black
                                                        : Colors.blueGrey,
                                                    fontSize: screenwidth / 20),
                                              ));
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

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
