import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController _minutesController = TextEditingController();

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
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

    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: AdvancedDrawer(
        backdropColor: Colors.white,
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
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 219, 242, 226),
            title: SizedBox(
              height: 30,
              child: Image.asset(
                'assets/images/appbartitle4.png',
                colorBlendMode: BlendMode.colorDodge,
              ),
            ),
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
            centerTitle: true,
          ),
          body: GetBuilder<GetxTapController>(
              init: controller,
              builder: (_) {
                return Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.2,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/bg.png'))),
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
                                    bgimagepath:
                                        "assets/images/soilHumidity.png",
                                    title: "Soil Humidity",
                                    iconpath: "assets/images/humidity.png",
                                    index: 0,
                                    value: controller.latestfeeddata?.field3,
                                  ),
                                  onTap: () {
                                    context.router
                                        .push(CommonGraphPage(index: index));
                                  },
                                );
                              case 1:
                                return GestureDetector(
                                  child: CardWidgetforSoil(
                                    bgimagepath:
                                        "assets/images/soilTemperature.png",
                                    title: "Soil Temperature",
                                    iconpath: "assets/images/temp.png",
                                    index: 1,
                                    value: controller.latestfeeddata?.field2,
                                  ),
                                  onTap: () {
                                    context.router
                                        .push(CommonGraphPage(index: index));
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
                                    value: controller.latestfeeddata?.field7,
                                  ),
                                  onTap: () {
                                    context.router
                                        .push(CommonGraphPage(index: index));
                                  },
                                );
                              case 3:
                                return GestureDetector(
                                  child: CardWidgetforSoil(
                                    bgimagepath: "assets/images/soilNPK.png",
                                    title: "Soil NPK",
                                    iconpath: "assets/images/npk.png",
                                    index: 3,
                                    value: controller.latestfeeddata?.field7,
                                  ),
                                  onTap: () {
                                    controller.getzoompan();
                                    context.router.push(SoilNpkPage());
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22)),
                          height: height / 2.5,
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  controller.elevation
                                                              .isEmpty ||
                                                          controller
                                                                  .elevation ==
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
                                                    "Water Pump",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              controller.pumpStatus
                                                  ? controller.elevation
                                                              .isEmpty ||
                                                          controller
                                                                  .elevation ==
                                                              '0'
                                                      ? const SizedBox(
                                                          height: 35,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 25),
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ))
                                                      :

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
                                                                  .fromARGB(255,
                                                                  58, 60, 62),
                                                          inactiveFgColor:
                                                              Colors.white,
                                                          initialLabelIndex: controller
                                                                      .elevation
                                                                      .isEmpty ||
                                                                  controller
                                                                          .elevation ==
                                                                      '0'
                                                              ? 0
                                                              : 1,
                                                          totalSwitches: 2,
                                                          labels: const [
                                                            'OFF',
                                                            'ON'
                                                          ],
                                                          radiusStyle: true,
                                                          onToggle: (index) {
                                                            controller.setpump(
                                                                pumpstatus:
                                                                    !controller
                                                                        .pumpStatus,
                                                                context:
                                                                    context);
                                                          },
                                                        )
                                                  : ToggleSwitch(
                                                      minWidth: 55,
                                                      minHeight: 40,
                                                      cornerRadius: 20.0,
                                                      activeBgColors: const [
                                                        [
                                                          Color(0xffdc6c73),
                                                        ],
                                                        [
                                                          Color.fromARGB(255,
                                                              60, 205, 130),
                                                        ]
                                                      ],
                                                      activeFgColor:
                                                          Colors.white,
                                                      inactiveBgColor:
                                                          const Color.fromARGB(
                                                              255, 58, 60, 62),
                                                      inactiveFgColor:
                                                          Colors.white,
                                                      initialLabelIndex: controller
                                                                  .elevation
                                                                  .isEmpty ||
                                                              controller
                                                                      .elevation ==
                                                                  '0'
                                                          ? 0
                                                          : 1,
                                                      totalSwitches: 2,
                                                      labels: const [
                                                        'OFF',
                                                        'ON'
                                                      ],
                                                      radiusStyle: true,
                                                      onToggle: (index) {
                                                        controller.setpump(
                                                            pumpstatus:
                                                                !controller
                                                                    .pumpStatus,
                                                            context: context);
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      controller
                                                              .pumpStatusmanually
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
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),

                                                  //! using dafault switch
                                                  Transform.scale(
                                                    scale: 1.4,
                                                    child: Switch(
                                                      // This bool value toggles the switch.
                                                      value: controller
                                                          .pumpStatusmanually,
                                                      activeColor: Colors.blue,
                                                      onChanged: controller
                                                              .pumpStatus
                                                          ? controller.elevation ==
                                                                  '1'
                                                              ? null
                                                              : (bool value) {
                                                                  // This is called when the user toggles the switch.
                                                                  controller.setpumpmanually(
                                                                      pumpstatus:
                                                                          value);
                                                                  _minutesController
                                                                      .clear();
                                                                }
                                                          : (bool value) {
                                                              // This is called when the user toggles the switch.
                                                              controller
                                                                  .setpumpmanually(
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

                                              controller.iswatermanualconfirm
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          "Time remaining : ",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        controller.min > 0
                                                            ? Text(
                                                                '${controller.min}min : ${controller.sec < 10 ? '0${controller.sec}sec' : '${controller.sec}sec'}',
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .red),
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
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .red),
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
                                                              .spaceAround,
                                                      children: [
                                                        const Text(
                                                          'Enter Time in Minute :',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Card(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.5))),
                                                              elevation: 5,
                                                              child: SizedBox(
                                                                height: 35,
                                                                child: Center(
                                                                  child: TextField(
                                                                      textAlign: TextAlign.center,
                                                                      controller: _minutesController,
                                                                      keyboardType: TextInputType.number,
                                                                      enabled: !controller.iswatermanualconfirm,
                                                                      decoration: const InputDecoration.collapsed(
                                                                        hintText:
                                                                            '',
                                                                      ),
                                                                      onChanged: null),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 16.0),
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                  side: const BorderSide(
                                                                      color: Colors
                                                                          .red))),
                                                              backgroundColor:
                                                                  const MaterialStatePropertyAll(
                                                                      Color.fromARGB(
                                                                          255,
                                                                          149,
                                                                          219,
                                                                          153))),
                                                          onPressed: controller
                                                                  .iswatermanualconfirm
                                                              ? null
                                                              : () {
                                                                  controller.updateTimerValue(
                                                                      timerforpump:
                                                                          int.parse(
                                                                              _minutesController.text));
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context2) =>
                                                                            AlertDialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      title: const Text(
                                                                          'Task Confirmation'),
                                                                      content: Text(
                                                                          'Are You Sure To Pump Water for ${_minutesController.text} Minute?'),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
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

                                                                                    if (controller.elevation == '1') {
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
                                                              const Text('Go'),
                                                        ),
                                                      ],
                                                    )
                                                  :
                                                  // ? Row(
                                                  //     mainAxisAlignment:
                                                  //         MainAxisAlignment
                                                  //             .spaceBetween,
                                                  //     children: [
                                                  //       // todo -> radiobutton 5mins
                                                  //       Row(
                                                  //         children: [
                                                  //           Transform.scale(
                                                  //             scale: 1.2,
                                                  //             child: Radio(
                                                  //                 materialTapTargetSize:
                                                  //                     MaterialTapTargetSize
                                                  //                         .shrinkWrap,
                                                  //                 visualDensity:
                                                  //                     VisualDensity
                                                  //                         .compact,
                                                  //                 activeColor:
                                                  //                     Colors.green,
                                                  //                 value: VisualType
                                                  //                     .fiveMins,
                                                  //                 groupValue: controller
                                                  //                     .selectedVisualType
                                                  //                     .value,
                                                  //                 onChanged: controller
                                                  //                         .iswatermanualconfirm
                                                  //                     ? null
                                                  //                     : (value) {
                                                  //                         controller.updateSelectedVisualType(
                                                  //                             value: value
                                                  //                                 as VisualType,
                                                  //                             timerforpump:
                                                  //                                 5);
                                                  //                         showDialog(
                                                  //                           context:
                                                  //                               context,
                                                  //                           builder:
                                                  //                               (context) =>
                                                  //                                   AlertDialog(
                                                  //                             backgroundColor:
                                                  //                                 Colors.white,
                                                  //                             title:
                                                  //                                 const Text('Task Confirmation'),
                                                  //                             content:
                                                  //                                 const Text('Are You Sure To Pump Water for 5 Minute?'),
                                                  //                             actions: [
                                                  //                               Row(
                                                  //                                 mainAxisAlignment: MainAxisAlignment.end,
                                                  //                                 children: [
                                                  //                                   ElevatedButton(
                                                  //                                       style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.grey[200], side: BorderSide(color: Colors.grey[700]!)),
                                                  //                                       onPressed: () {
                                                  //                                         controller.setradiobuttoncancellationhandle();
                                                  //                                         context.router.pop();
                                                  //                                       },
                                                  //                                       child: Text(
                                                  //                                         "CANCEL",
                                                  //                                         style: TextStyle(color: Colors.red[300]!, fontWeight: FontWeight.bold),
                                                  //                                       )),
                                                  //                                   Padding(
                                                  //                                     padding: const EdgeInsets.only(left: 10),
                                                  //                                     child: ElevatedButton(
                                                  //                                         style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                  //                                         onPressed: () {
                                                  //                                           controller.startTimer();
                                                  //                                           context.router.pop();
                                                  //                                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                  //                                             behavior: SnackBarBehavior.fixed,
                                                  //                                             backgroundColor: Colors.green,

                                                  //                                             content: Text('Water Pump Activated For 5 Min'),
                                                  //                                             duration: Duration(seconds: 3), // Adjust the duration as needed
                                                  //                                           ));
                                                  //                                         },
                                                  //                                         child: const Text(
                                                  //                                           "OK",
                                                  //                                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                  //                                         )),
                                                  //                                   )
                                                  //                                 ],
                                                  //                               ),
                                                  //                             ],
                                                  //                           ),
                                                  //                         );
                                                  //                       }),
                                                  //           ),
                                                  //           const Text(
                                                  //             '05 mins',
                                                  //             style: TextStyle(
                                                  //                 fontSize: 17),
                                                  //           ),
                                                  //         ],
                                                  //       ),
                                                  //       // todo -> radiobutton 10mins

                                                  //       Row(
                                                  //         children: [
                                                  //           Transform.scale(
                                                  //             scale: 1.2,
                                                  //             child: Radio(
                                                  //                 visualDensity:
                                                  //                     VisualDensity
                                                  //                         .compact,
                                                  //                 materialTapTargetSize:
                                                  //                     MaterialTapTargetSize
                                                  //                         .shrinkWrap,
                                                  //                 activeColor:
                                                  //                     Colors.green,
                                                  //                 toggleable: true,
                                                  //                 value: VisualType
                                                  //                     .tenMins,
                                                  //                 groupValue: controller
                                                  //                     .selectedVisualType
                                                  //                     .value,
                                                  //                 onChanged: controller
                                                  //                         .iswatermanualconfirm
                                                  //                     ? null
                                                  //                     : (value) {
                                                  //                         controller.updateSelectedVisualType(
                                                  //                             value: value
                                                  //                                 as VisualType,
                                                  //                             timerforpump:
                                                  //                                 10);
                                                  //                         showDialog(
                                                  //                           context:
                                                  //                               context,
                                                  //                           builder:
                                                  //                               (context) =>
                                                  //                                   AlertDialog(
                                                  //                             backgroundColor:
                                                  //                                 Colors.white,
                                                  //                             title:
                                                  //                                 const Text('Task Confirmation'),
                                                  //                             content:
                                                  //                                 const Text('Are You Sure To Pump Water for 10 Minute?'),
                                                  //                             actions: [
                                                  //                               Row(
                                                  //                                 mainAxisAlignment: MainAxisAlignment.end,
                                                  //                                 children: [
                                                  //                                   ElevatedButton(
                                                  //                                       style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.grey[200], side: BorderSide(color: Colors.grey[700]!)),
                                                  //                                       onPressed: () {
                                                  //                                         controller.setradiobuttoncancellationhandle();
                                                  //                                         context.router.pop();
                                                  //                                       },
                                                  //                                       child: Text(
                                                  //                                         "CANCEL",
                                                  //                                         style: TextStyle(color: Colors.red[300]!, fontWeight: FontWeight.bold),
                                                  //                                       )),
                                                  //                                   Padding(
                                                  //                                     padding: const EdgeInsets.only(left: 10),
                                                  //                                     child: ElevatedButton(
                                                  //                                         style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                  //                                         onPressed: () {
                                                  //                                           controller.startTimer();
                                                  //                                           context.router.pop();
                                                  //                                         },
                                                  //                                         child: const Text(
                                                  //                                           "OK",
                                                  //                                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                  //                                         )),
                                                  //                                   )
                                                  //                                 ],
                                                  //                               ),
                                                  //                             ],
                                                  //                           ),
                                                  //                         );
                                                  //                       }),
                                                  //           ),
                                                  //           const Text(
                                                  //             '10 mins',
                                                  //             style: TextStyle(
                                                  //                 fontSize: 17),
                                                  //           ),
                                                  //         ],
                                                  //       ),
                                                  //       // todo -> radiobutton 15mins

                                                  //       Row(
                                                  //         children: [
                                                  //           Transform.scale(
                                                  //             scale: 1.2,
                                                  //             child: Radio(
                                                  //                 visualDensity:
                                                  //                     VisualDensity
                                                  //                         .compact,
                                                  //                 materialTapTargetSize:
                                                  //                     MaterialTapTargetSize
                                                  //                         .shrinkWrap,
                                                  //                 activeColor:
                                                  //                     Colors.green,
                                                  //                 value: VisualType
                                                  //                     .fifteenMins,
                                                  //                 groupValue: controller
                                                  //                     .selectedVisualType
                                                  //                     .value,
                                                  //                 onChanged: controller
                                                  //                         .iswatermanualconfirm
                                                  //                     ? null
                                                  //                     : (value) {
                                                  //                         controller.updateSelectedVisualType(
                                                  //                             value: value
                                                  //                                 as VisualType,
                                                  //                             timerforpump:
                                                  //                                 15);
                                                  //                         showDialog(
                                                  //                           context:
                                                  //                               context,
                                                  //                           builder:
                                                  //                               (context) =>
                                                  //                                   AlertDialog(
                                                  //                             backgroundColor:
                                                  //                                 Colors.white,
                                                  //                             title:
                                                  //                                 const Text('Task Confirmation'),
                                                  //                             content:
                                                  //                                 const Text('Are You Sure To Pump Water for 15 Minute?'),
                                                  //                             actions: [
                                                  //                               Row(
                                                  //                                 mainAxisAlignment: MainAxisAlignment.end,
                                                  //                                 children: [
                                                  //                                   ElevatedButton(
                                                  //                                       style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.grey[200], side: BorderSide(color: Colors.grey[700]!)),
                                                  //                                       onPressed: () {
                                                  //                                         controller.setradiobuttoncancellationhandle();
                                                  //                                         context.router.pop();
                                                  //                                       },
                                                  //                                       child: Text(
                                                  //                                         "CANCEL",
                                                  //                                         style: TextStyle(color: Colors.red[300]!, fontWeight: FontWeight.bold),
                                                  //                                       )),
                                                  //                                   Padding(
                                                  //                                     padding: const EdgeInsets.only(left: 10),
                                                  //                                     child: ElevatedButton(
                                                  //                                         style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                  //                                         onPressed: () {
                                                  //                                           controller.startTimer();
                                                  //                                           context.router.pop();
                                                  //                                         },
                                                  //                                         child: const Text(
                                                  //                                           "OK",
                                                  //                                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                  //                                         )),
                                                  //                                   )
                                                  //                                 ],
                                                  //                               ),
                                                  //                             ],
                                                  //                           ),
                                                  //                         );
                                                  //                       }),
                                                  //           ),
                                                  //           const Text(
                                                  //             '15 mins',
                                                  //             style: TextStyle(
                                                  //                 fontSize: 17),
                                                  //           ),
                                                  //         ],
                                                  //       ),
                                                  //     ],
                                                  //   )
                                                  const SizedBox()
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
        ),
      ),
    );
  }
}
