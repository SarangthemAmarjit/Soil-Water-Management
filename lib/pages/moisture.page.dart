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
                      height: screenheight / 3,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                  tooltipBehavior:
                                      TooltipBehavior(enable: false),

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
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true))
                                  ]),

                              //todo-->
                            ]),
                      ),
                    ),
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
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
