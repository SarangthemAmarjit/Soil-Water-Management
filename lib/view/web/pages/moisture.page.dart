import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

// TODO: to change the page name

@RoutePage()
class WebCommonGraphPage extends StatelessWidget {
  final int index;
  const WebCommonGraphPage({super.key, required this.index});

  // final List<DateTime> DateData = [
  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    double screenheight = MediaQuery.of(context).size.height;
    log(controller.allsoildatamap[1]['field3']);
    double screenwidth = MediaQuery.of(context).size.width;

//!    from datetime import datetime
//! sales_data = datetime(2019, 1, 1, 12, 34)  # Year: 2019, Month: 1, Day: 1, Hour: 12, Minute: 34

    // final List<Moisture> moisturChartData = [
    //   Moisture(DateTime(2045, 1, 1, 01, 00), 76),
    //   Moisture(DateTime(2045, 1, 1, 02, 00), 56),
    //   Moisture(DateTime(2045, 1, 1, 03, 00), 43),
    //   Moisture(DateTime(2045, 1, 1, 04, 00), 21),
    //   Moisture(DateTime(2045, 1, 1, 07, 00), 56),
    //   Moisture(DateTime(2045, 1, 1, 08, 00), 87),
    //   Moisture(DateTime(2045, 1, 1, 09, 00), 65),
    //   Moisture(DateTime(2045, 1, 1, 10, 00), 21),
    //   Moisture(DateTime(2045, 1, 1, 11, 00), 34),
    //   Moisture(DateTime(2045, 1, 1, 12, 00), 67),
    // ];

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
                    child: Center(
                        child: SfCartesianChart(
                            tooltipBehavior: TooltipBehavior(
                              enable: true,
                            ),
                            zoomPanBehavior: controller.zoomPanBehavior,
                            primaryXAxis: const DateTimeAxis(
                                autoScrollingMode: AutoScrollingMode.end,
                                initialZoomPosition: 1,
                                initialZoomFactor: 0.01),
                            series: <CartesianSeries>[
                          // Renders line chart
                          LineSeries<Moisture, DateTime>(
                              isVisibleInLegend: true,
                              initialIsVisible: true,
                              name: index == 0
                                  ? "Moisture Level"
                                  : index == 1
                                      ? "Temperature"
                                      : index == 2
                                          ? "pH Level"
                                          : "",
                              enableTooltip: true,
                              markerSettings:
                                  const MarkerSettings(isVisible: true),
                              dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  labelPosition: ChartDataLabelPosition.inside),
                              dataSource:

                                  //! above codes to be used for dateTime
                                  // moisturChartData,
                                  _getData(
                                      index: index, controller: controller),
                              xValueMapper: (Moisture moisture, _) =>
                                  moisture.time,
                              yValueMapper: (Moisture moisture, _) =>
                                  moisture.moisture)
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
                              const SizedBox(
                                  // height: screenheight / 82,
                                  ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.history,
                                      size: screenwidth / 40,
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
                                            fontSize: screenwidth / 50,
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
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.orange,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              // height: 40,
                              child: SizedBox(
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
                                                      top:
                                                          Radius.circular(14))),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: screenwidth / 60,
                                              vertical: screenwidth / 60),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Time",
                                                style: TextStyle(
                                                    fontSize: screenwidth / 50,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                index == 0
                                                    ? "Moisture Level"
                                                    : index == 1
                                                        ? "Temperature"
                                                        : index == 2
                                                            ? "pH Level"
                                                            : "",
                                                style: TextStyle(
                                                    fontSize: screenwidth / 50,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
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
                                                .alldatetimelast10.length,
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context,
                                                int ind) {
                                              return Container(
                                                margin: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: ind % 2 == 0
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
                                                        index == 0
                                                            ? controller
                                                                    .allsoildatamaplast10[
                                                                        ind][
                                                                        'field3']
                                                                    .toString()
                                                                    .isEmpty
                                                                ? 'N.A'
                                                                : "${controller.allsoildatamaplast10[ind]['field3']}"
                                                            : index == 1
                                                                ? controller
                                                                        .allsoildatamaplast10[
                                                                            ind]
                                                                            [
                                                                            'field2']
                                                                        .toString()
                                                                        .isEmpty
                                                                    ? 'N.A'
                                                                    : "${controller.allsoildatamaplast10[ind]['field2']}"
                                                                : index == 2
                                                                    ? controller
                                                                            .allsoildatamaplast10[ind]['field7']
                                                                            .toString()
                                                                            .isEmpty
                                                                        ? 'N.A'
                                                                        : "${controller.allsoildatamaplast10[ind]['field7']}"
                                                                    : "N.A",
                                                        style: TextStyle(
                                                            color: ind % 2 == 1
                                                                ? Colors.black
                                                                : Colors.black,
                                                            fontSize:
                                                                screenwidth /
                                                                    45),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      DateFormat('h:mm a')
                                                          .format(controller
                                                                  .alldatetimelast10[
                                                              ind]),
                                                      style: TextStyle(
                                                          color: ind % 2 == 1
                                                              ? Colors.black
                                                              : Colors.black,
                                                          fontSize:
                                                              screenwidth / 45),
                                                    )),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
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
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Moisture> _getData(
      {required int index, required GetxTapController controller}) {
    List<Moisture> data = [];
    for (int i = 0; i < controller.allsoildatamap.length; i++) {
      if (controller.allsoildatamap.isNotEmpty) {
        data.add(Moisture(
            controller.alldatetime[i],
            index == 0
                ? controller.allsoildatamap[i]['field3'].toString().isEmpty
                    ? 0
                    : double.parse(controller.allsoildatamap[i]['field3'])
                : index == 1
                    ? controller.allsoildatamap[i]['field2'].toString().isEmpty
                        ? 0
                        : double.parse(controller.allsoildatamap[i]['field2'])
                    : index == 2
                        ? controller.allsoildatamap[i]['field7']
                                .toString()
                                .isEmpty
                            ? 0
                            : double.parse(
                                controller.allsoildatamap[i]['field7'])
                        : 0));
      }
    }
    return data;
  }
}

class Moisture {
  Moisture(this.time, this.moisture);
  final DateTime time;
  final double moisture;
}
