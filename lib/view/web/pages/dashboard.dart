import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:soilmoisturedetector/constant/constant.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/router/router.gr.dart';
import 'package:soilmoisturedetector/widget/cardwidget.dart';
import 'package:soilmoisturedetector/widget/drawerWidget.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

@RoutePage()
class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

TextEditingController _minutesController = TextEditingController();

class _WebHomePageState extends State<WebHomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  bool isAutomationMode = false;

  void _toggleSwitch(bool value) {
    setState(() {
      isAutomationMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    Future<bool> showExitPopup() async {
      return await QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
      );

      // showDialog(
      //       context: context,
      //       builder: (context) => AlertDialog(
      //         title: const Text('Exit App'),
      //         content: const Text('Do you want to exit an App?'),
      //         actions: [
      //           ElevatedButton(
      //             onPressed: () => context.router.pop(false),
      //             child: const Text('No'),
      //           ),
      //           ElevatedButton(
      //             onPressed: () => SystemNavigator.pop(),
      //             child: const Text('Yes'),
      //           ),
      //         ],
      //       ),
      //     ) ??
      //     false;
    }

    return AdvancedDrawer(
      backdrop: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.1,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg.png'))),
      ),

      controller: _advancedDrawerController,
      animationCurve: Curves.easeIn,

      animationDuration: const Duration(milliseconds: 250),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const drawerWidget(),
      child: Scaffold(
        body: GetBuilder<GetxTapController>(builder: (_) {
          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.2,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bg.png'))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _handleMenuButtonPressed,
                          icon: ValueListenableBuilder<AdvancedDrawerValue>(
                            valueListenable: _advancedDrawerController,
                            builder: (_, value, __) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                child: Icon(
                                  value.visible ? Icons.clear : Icons.menu,
                                  size: 27,
                                  key: ValueKey<bool>(value.visible),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          'DASHBOARD',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22)),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.red,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 12),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 80),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              "assets/images/mode.png",
                                                              height: 35,
                                                            ),
                                                            const SizedBox(
                                                              width: 15,
                                                            ),
                                                            const Text(
                                                              "Pump Mode",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: ToggleSwitch(
                                                        cornerRadius: 5,
                                                        activeBgColors: const [
                                                          [
                                                            Color.fromARGB(255,
                                                                58, 185, 120),
                                                          ],
                                                          [
                                                            Color.fromARGB(255,
                                                                58, 185, 120),
                                                          ],
                                                        ],

                                                        // activeFgColor: Colors.green,
                                                        // inactiveBgColor:
                                                        //     const Color.fromARGB(
                                                        //         255, 58, 60, 62),
                                                        // inactiveFgColor: Colors.white,
                                                        initialLabelIndex:
                                                            controller.ismanual
                                                                ? 1
                                                                : 0,
                                                        totalSwitches: 2,
                                                        labels: const [
                                                          'Auto',
                                                          'Manual'
                                                        ],
                                                        radiusStyle: false,
                                                        onToggle: (index) {
                                                          controller
                                                              .setwaterpumpmode(
                                                                  ispoweron:
                                                                      false);
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: FittedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 140),
                                                      child: Row(
                                                        children: [
                                                          controller.field8
                                                                      .isEmpty ||
                                                                  controller
                                                                          .field8 ==
                                                                      '2' ||
                                                                  controller
                                                                          .field8 ==
                                                                      '0'
                                                              ? Image.asset(
                                                                  "assets/images/pumpOFF.png",
                                                                  height: 60,
                                                                )
                                                              : Image.asset(
                                                                  "assets/images/pumpONgif.gif",
                                                                  height: 60,
                                                                ),

                                                          // Icon(
                                                          //   Icons.electrical_services_outlined,
                                                          //   size: 32,
                                                          //   color: Colors.amber,
                                                          // ),

                                                          const Text(
                                                            "Power",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FittedBox(
                                                    child: controller.pumpStatus
                                                        ? controller.field8
                                                                    .isEmpty ||
                                                                controller
                                                                        .field8 ==
                                                                    '0' ||
                                                                controller
                                                                        .field8 ==
                                                                    '2'
                                                            ? const SizedBox(
                                                                height: 35,
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              25),
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                ))
                                                            :

                                                            //! using dafault switch
                                                            ToggleSwitch(
                                                                minWidth: 40,
                                                                changeOnTap:
                                                                    controller
                                                                            .ismanual
                                                                        ? true
                                                                        : false,
                                                                minHeight: 30,
                                                                cornerRadius:
                                                                    20.0,
                                                                activeBgColors: [
                                                                  [
                                                                    controller
                                                                            .ismanual
                                                                        ? const Color(
                                                                            0xffdc6c73)
                                                                        : Colors
                                                                            .grey,
                                                                  ],
                                                                  const [
                                                                    Color.fromARGB(
                                                                        255,
                                                                        60,
                                                                        205,
                                                                        130),
                                                                  ]
                                                                ],
                                                                activeFgColor:
                                                                    Colors
                                                                        .white,
                                                                inactiveBgColor:
                                                                    const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        58,
                                                                        60,
                                                                        62),
                                                                inactiveFgColor:
                                                                    Colors
                                                                        .white,
                                                                initialLabelIndex: controller
                                                                            .field8
                                                                            .isEmpty ||
                                                                        controller.field8 ==
                                                                            '0' ||
                                                                        controller.field8 ==
                                                                            '2'
                                                                    ? 0
                                                                    : 1,
                                                                totalSwitches:
                                                                    2,
                                                                labels: const [
                                                                  'OFF',
                                                                  'ON'
                                                                ],
                                                                radiusStyle:
                                                                    true,
                                                                onToggle: controller
                                                                        .ismanual
                                                                    ? (index) {
                                                                        controller.setpump(
                                                                            pumpstatus:
                                                                                !controller.pumpStatus,
                                                                            context: context);
                                                                      }
                                                                    : null,
                                                              )
                                                        : ToggleSwitch(
                                                            changeOnTap:
                                                                controller
                                                                        .ismanual
                                                                    ? true
                                                                    : false,
                                                            minWidth: 55,
                                                            minHeight: 40,
                                                            cornerRadius: 20.0,
                                                            activeBgColors: [
                                                              [
                                                                controller
                                                                        .ismanual
                                                                    ? const Color(
                                                                        0xffdc6c73)
                                                                    : Colors
                                                                        .grey,
                                                              ],
                                                              const [
                                                                Color.fromARGB(
                                                                    255,
                                                                    60,
                                                                    205,
                                                                    130),
                                                              ]
                                                            ],
                                                            activeFgColor:
                                                                Colors.white,
                                                            inactiveBgColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    58,
                                                                    60,
                                                                    62),
                                                            inactiveFgColor:
                                                                Colors.white,
                                                            initialLabelIndex: controller
                                                                        .field8
                                                                        .isEmpty ||
                                                                    controller
                                                                            .field8 ==
                                                                        '0' ||
                                                                    controller
                                                                            .field8 ==
                                                                        '2'
                                                                ? 0
                                                                : 1,
                                                            totalSwitches: 2,
                                                            labels: const [
                                                              'OFF',
                                                              'ON'
                                                            ],
                                                            radiusStyle: true,
                                                            onToggle: controller
                                                                    .ismanual
                                                                ? (index) {
                                                                    controller.setpump(
                                                                        pumpstatus:
                                                                            !controller
                                                                                .pumpStatus,
                                                                        context:
                                                                            context);
                                                                  }
                                                                : controller.field8 ==
                                                                        '1'
                                                                    ? (index) {
                                                                        controller.automationmodeerrordialog(
                                                                            context:
                                                                                context);
                                                                      }
                                                                    : null,
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            controller.ismanual
                                                ? Column(
                                                    children: [
                                                      //! MANUAL TIMER
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: FittedBox(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            160),
                                                                child: Row(
                                                                  children: [
                                                                    controller
                                                                            .pumpStatusmanually
                                                                        ? Image
                                                                            .asset(
                                                                            "assets/images/timer.png",
                                                                            height:
                                                                                40,
                                                                          )
                                                                        : Image
                                                                            .asset(
                                                                            "assets/images/timerOFF.png",
                                                                            height:
                                                                                40,
                                                                          ),
                                                                    const Text(
                                                                      "   Manual Timer",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          //! using dafault switch
                                                          Transform.scale(
                                                            scale: 1.4,
                                                            child: Switch(
                                                              // This bool value toggles the switch.
                                                              value: controller
                                                                  .pumpStatusmanually,
                                                              activeColor:
                                                                  Colors.blue,
                                                              onChanged: controller
                                                                      .pumpStatus
                                                                  ? controller.field8 ==
                                                                          '1'
                                                                      ? null
                                                                      : (bool
                                                                          value) {
                                                                          // This is called when the user toggles the switch.
                                                                          controller.setpumpmanually(
                                                                              pumpstatus: value);
                                                                          _minutesController
                                                                              .clear();
                                                                        }
                                                                  : (bool
                                                                      value) {
                                                                      // This is called when the user toggles the switch.
                                                                      controller.setpumpmanually(
                                                                          pumpstatus:
                                                                              value);
                                                                      _minutesController
                                                                          .clear();
                                                                    },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),

                                                      controller
                                                              .iswatermanualconfirm
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Text(
                                                                  "Time remaining : ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                                controller.min >
                                                                        0
                                                                    ? Text(
                                                                        '${controller.min}min : ${controller.sec < 10 ? '0${controller.sec}sec' : '${controller.sec}sec'}',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.red),
                                                                      )
                                                                    : Text(
                                                                        controller.sec <
                                                                                10
                                                                            ? '0${controller.sec}sec'
                                                                            : '${controller.sec}sec',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                20,
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

                                                      controller
                                                              .pumpStatusmanually
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                const Text(
                                                                  'Enter Time in Minute :',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    child: Card(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          side:
                                                                              BorderSide(color: Colors.black.withOpacity(0.5))),
                                                                      elevation:
                                                                          5,
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            35,
                                                                        child:
                                                                            Center(
                                                                          child: TextField(
                                                                              textAlign: TextAlign.center,
                                                                              controller: _minutesController,
                                                                              keyboardType: TextInputType.number,
                                                                              enabled: !controller.iswatermanualconfirm,
                                                                              decoration: const InputDecoration.collapsed(
                                                                                hintText: '',
                                                                              ),
                                                                              onChanged: null),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width:
                                                                        16.0),
                                                                ElevatedButton(
                                                                  style: ButtonStyle(
                                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              15),
                                                                          side: const BorderSide(
                                                                              color: Colors
                                                                                  .red))),
                                                                      backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(
                                                                          255,
                                                                          149,
                                                                          219,
                                                                          153))),
                                                                  onPressed:
                                                                      controller
                                                                              .iswatermanualconfirm
                                                                          ? null
                                                                          : () {
                                                                              controller.updateTimerValue(timerforpump: int.parse(_minutesController.text));
                                                                              showDialog(
                                                                                context: context,
                                                                                builder: (context2) => AlertDialog(
                                                                                  backgroundColor: Colors.white,
                                                                                  title: const Text('Task Confirmation'),
                                                                                  content: Text('Are You Sure To Pump Water for ${_minutesController.text} Minute?'),
                                                                                  actions: [
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        ElevatedButton(
                                                                                            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.grey[200], side: BorderSide(color: Colors.grey[700]!)),
                                                                                            onPressed: () {
                                                                                              context2.router.pop();
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
                                                                                                context2.router.maybePop();
                                                                                                controller.startTimer(context: context);

                                                                                                if (controller.field8 == '1') {
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                    behavior: SnackBarBehavior.fixed,
                                                                                                    backgroundColor: Colors.green,

                                                                                                    content: Text('Water Pump Activated For ${_minutesController.text} Min'),
                                                                                                    duration: const Duration(seconds: 3), // Adjust the duration as needed
                                                                                                  ));
                                                                                                }
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
                                                                            },
                                                                  child:
                                                                      const Text(
                                                                          'Go'),
                                                                ),
                                                              ],
                                                            )
                                                          : const SizedBox()
                                                    ],
                                                  )
                                                : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: Container(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   height: height / 16,
                                  // ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    padding: const EdgeInsets.all(20),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: .93,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      switch (index) {
                                        case 0:
                                          return GestureDetector(
                                            child: CardWidgetforSoil(
                                              bgimagepath:
                                                  "assets/images/soilHumidity.png",
                                              title: "Soil Humidity",
                                              iconpath:
                                                  "assets/images/humidity.png",
                                              index: 0,
                                              value: controller
                                                  .latestfeeddata?.field3,
                                            ),
                                            onTap: () {
                                              context.router.push(
                                                  CommonGraphPage(
                                                      index: index));
                                            },
                                          );
                                        case 1:
                                          return GestureDetector(
                                            child: CardWidgetforSoil(
                                              bgimagepath:
                                                  "assets/images/soilTemperature.png",
                                              title: "Soil Temperature",
                                              iconpath:
                                                  "assets/images/temp.png",
                                              index: 1,
                                              value: controller
                                                  .latestfeeddata?.field2,
                                            ),
                                            onTap: () {
                                              context.router.push(
                                                  CommonGraphPage(
                                                      index: index));
                                            },
                                          );
                                        case 2:
                                          return GestureDetector(
                                            child: CardWidgetforSoil(
                                              bgimagepath:
                                                  "assets/images/soilPhLevel.png",
                                              title: "Soil pH Level",
                                              iconpath: "assets/images/ph.png",
                                              index: 2,
                                              value: controller
                                                  .latestfeeddata?.field7,
                                            ),
                                            onTap: () {
                                              context.router.push(
                                                  CommonGraphPage(
                                                      index: index));
                                            },
                                          );
                                        case 3:
                                          return GestureDetector(
                                            child: CardWidgetforSoil(
                                              bgimagepath:
                                                  "assets/images/soilNPK.png",
                                              title: "Soil NPK",
                                              iconpath: "assets/images/npk.png",
                                              index: 3,
                                              value: controller
                                                  .latestfeeddata?.field7,
                                            ),
                                            onTap: () {
                                              controller.getzoompan();
                                              context.router
                                                  .push(SoilNpkPage());
                                            },
                                          );
                                        default:
                                      }
                                      return null;
                                    },
                                  ),

                                  //! END OF GRIDVIEW

                                  //!
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
