import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/constant/constant.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/router/router.gr.dart';
import 'package:soilmoisturedetector/widget/cardwidget.dart';
import 'package:soilmoisturedetector/widget/drawerWidget.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../widget/drawerWidget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 242, 226),
        title: Text("Smart Irrigation System",
            style: TextStyle(
              wordSpacing: 2,
              letterSpacing: 2,
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width / 20,
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
            )),
        centerTitle: true,
      ),
      drawer: const drawerWidget(),
      body: GetBuilder<GetxTapController>(builder: (_) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.7,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/BGspray.png'))),
            child: Column(
              children: [
                // SizedBox(
                //   height: height / 16,
                // ),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .82,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    switch (index) {
                      case 0:
                        return GestureDetector(
                          child: CardWidgetforSoil(
                            bgimagepath: "assets/images/soilHumidity.png",
                            title: "Soil Humidity",
                            iconpath: "assets/images/humidity.png",
                            index: 0,
                            value: controller.latestfeeddata == null
                                ? null
                                : controller.latestfeeddata!.field3,
                          ),
                          onTap: () {
                            context.router.push(const MoisturePage());
                          },
                        );
                      case 1:
                        return GestureDetector(
                          child: CardWidgetforSoil(
                            bgimagepath: "assets/images/soilTemperature.png",
                            title: "Soil Temperature",
                            iconpath: "assets/images/temp.png",
                            index: 1,
                            value: controller.latestfeeddata == null
                                ? null
                                : controller.latestfeeddata!.field2,
                          ),
                          onTap: () {
                            context.router.push(const MoisturePage());
                          },
                        );
                      case 2:
                        return GestureDetector(
                          child: CardWidgetforSoil(
                            bgimagepath: "assets/images/soilPhLevel.png",
                            title: "Soil PH Level",
                            iconpath: "assets/images/ph.png",
                            index: 2,
                            value: controller.latestfeeddata == null
                                ? null
                                : controller.latestfeeddata!.field7,
                          ),
                          onTap: () {
                            context.router.push(const MoisturePage());
                          },
                        );
                      case 3:
                        return GestureDetector(
                          child: CardWidgetforSoil(
                            bgimagepath: "assets/images/soilNPK.png",
                            title: "Soil NPK",
                            iconpath: "assets/images/npk.png",
                            index: 3,
                            value: controller.latestfeeddata == null
                                ? null
                                : controller.latestfeeddata!.field7,
                          ),
                          onTap: () {
                            context.router.push(const SoilNpkPage());
                          },
                        );
                      default:
                    }
                    return null;
                  },
                ),

                //! END OF GRIDVIEW

                //!
                Container(
                  decoration: const BoxDecoration(),
                  height: height / 3,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            color: Colors.teal.withOpacity(.1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 12),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          controller.pumpStatus
                                              ? Image.asset(
                                                  "assets/images/pumpONgif.gif",
                                                  height: 60,
                                                )
                                              : Image.asset(
                                                  "assets/images/pumpOFF.png",
                                                  height: 60,
                                                )

                                          // Icon(
                                          //   Icons.electrical_services_outlined,
                                          //   size: 32,
                                          //   color: Colors.amber,
                                          // ),
                                          ,
                                          const Text(
                                            "Water Pump",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),

                                      //! using dafault switch
                                      ToggleSwitch(
                                        minWidth: 55,
                                        minHeight: 40,
                                        cornerRadius: 20.0,
                                        activeBgColors: const [
                                          [
                                            Color(0xffdc6c73),
                                          ],
                                          [
                                            Color.fromARGB(255, 60, 205, 130),
                                          ]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: const Color.fromARGB(
                                            255, 58, 60, 62),
                                        inactiveFgColor: Colors.white,
                                        initialLabelIndex:
                                            controller.pumpStatus ? 1 : 0,
                                        totalSwitches: 2,
                                        labels: const ['OFF', 'ON'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          controller.setpump(
                                              pumpstatus:
                                                  index == 0 ? false : true);
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Column(
                                    children: [
                                      //! MANUAL TIMER
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              controller.pumpStatusmanually
                                                  ? Image.asset(
                                                      "assets/images/timer.png",
                                                      height: 40,
                                                    )
                                                  : Image.asset(
                                                      "assets/images/timerOFF.png",
                                                      height: 40,
                                                    ),
                                              const Text(
                                                "   Manual Timer",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),

                                          //! using dafault switch
                                          Switch(
                                            // This bool value toggles the switch.
                                            value:
                                                controller.pumpStatusmanually,
                                            activeColor: Colors.blue,
                                            onChanged: controller.pumpStatus
                                                ? null
                                                : (bool value) {
                                                    // This is called when the user toggles the switch.
                                                    controller.setpumpmanually(
                                                        pumpstatus: value);
                                                  },
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),

                                      controller.iswatermanualconfirm
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Time remaining : ",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                controller.min > 0
                                                    ? Text(
                                                        '${controller.min}min : ${controller.sec < 10 ? '0${controller.sec}sec' : '${controller.sec}sec'}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                      )
                                                    : Text(
                                                        controller.sec < 10
                                                            ? '0${controller.sec}sec'
                                                            : '${controller.sec}sec',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                      )
                                              ],
                                            )
                                          : const SizedBox(),
                                      const SizedBox(
                                        height: 12,
                                      ),

                                      controller.pumpStatusmanually
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // todo -> radiobutton 5mins
                                                Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 1.2,
                                                      child: Radio(
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          activeColor:
                                                              Colors.green,
                                                          value: VisualType
                                                              .fiveMins,
                                                          groupValue: controller
                                                              .selectedVisualType
                                                              .value,
                                                          onChanged: controller
                                                                  .iswatermanualconfirm
                                                              ? null
                                                              : (value) {
                                                                  controller.updateSelectedVisualType(
                                                                      value: value
                                                                          as VisualType,
                                                                      timerforpump:
                                                                          5);
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            AlertDialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      title: const Text(
                                                                          'Task Confirmation'),
                                                                      content:
                                                                          const Text(
                                                                              'Are You Sure To Pump Water for 5 Minute?'),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.grey[200], side: BorderSide(color: Colors.grey[700]!)),
                                                                                onPressed: () {
                                                                                  context.router.pop();
                                                                                },
                                                                                child: Text(
                                                                                  "CANCEL",
                                                                                  style: TextStyle(color: Colors.red[300]!, fontWeight: FontWeight.bold),
                                                                                )),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                                                  onPressed: () {
                                                                                    controller.startTimer();
                                                                                    context.router.pop();
                                                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                                      behavior: SnackBarBehavior.fixed,
                                                                                      backgroundColor: Colors.green,

                                                                                      content: Text('Water Pump Activated For 5 Min'),
                                                                                      duration: Duration(seconds: 3), // Adjust the duration as needed
                                                                                    ));
                                                                                  },
                                                                                  child: const Text(
                                                                                    "OK",
                                                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  )),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                    ),
                                                    const Text(
                                                      '05 mins',
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                // todo -> radiobutton 10mins

                                                Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 1.2,
                                                      child: Radio(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          activeColor:
                                                              Colors.green,
                                                          toggleable: true,
                                                          value: VisualType
                                                              .tenMins,
                                                          groupValue: controller
                                                              .selectedVisualType
                                                              .value,
                                                          onChanged: controller
                                                                  .iswatermanualconfirm
                                                              ? null
                                                              : (value) {
                                                                  controller.updateSelectedVisualType(
                                                                      value: value
                                                                          as VisualType,
                                                                      timerforpump:
                                                                          10);
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            AlertDialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      title: const Text(
                                                                          'Task Confirmation'),
                                                                      content:
                                                                          const Text(
                                                                              'Are You Sure To Pump Water for 10 Minute?'),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.grey[200], side: BorderSide(color: Colors.grey[700]!)),
                                                                                onPressed: () {
                                                                                  context.router.pop();
                                                                                },
                                                                                child: Text(
                                                                                  "CANCEL",
                                                                                  style: TextStyle(color: Colors.red[300]!, fontWeight: FontWeight.bold),
                                                                                )),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                                                  onPressed: () {
                                                                                    controller.startTimer();
                                                                                    context.router.pop();
                                                                                  },
                                                                                  child: const Text(
                                                                                    "OK",
                                                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  )),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                    ),
                                                    const Text(
                                                      '10 mins',
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                // todo -> radiobutton 15mins

                                                Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 1.2,
                                                      child: Radio(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          activeColor:
                                                              Colors.green,
                                                          value: VisualType
                                                              .fifteenMins,
                                                          groupValue: controller
                                                              .selectedVisualType
                                                              .value,
                                                          onChanged: controller
                                                                  .iswatermanualconfirm
                                                              ? null
                                                              : (value) {
                                                                  controller.updateSelectedVisualType(
                                                                      value: value
                                                                          as VisualType,
                                                                      timerforpump:
                                                                          15);
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            AlertDialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      title: const Text(
                                                                          'Task Confirmation'),
                                                                      content:
                                                                          const Text(
                                                                              'Are You Sure To Pump Water for 15 Minute?'),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.grey[200], side: BorderSide(color: Colors.grey[700]!)),
                                                                                onPressed: () {
                                                                                  context.router.pop();
                                                                                },
                                                                                child: Text(
                                                                                  "CANCEL",
                                                                                  style: TextStyle(color: Colors.red[300]!, fontWeight: FontWeight.bold),
                                                                                )),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                                                  onPressed: () {
                                                                                    controller.startTimer();
                                                                                    context.router.pop();
                                                                                  },
                                                                                  child: const Text(
                                                                                    "OK",
                                                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                                                  )),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                    ),
                                                    const Text(
                                                      '15 mins',
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
