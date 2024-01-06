import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:soilmoisturedetector/constant/constant.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/widget/cardwidget.dart';

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
      body: GetBuilder<GetxTapController>(builder: (_) {
        return SingleChildScrollView(
          child: Obx(
            () => controller.isDataLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SizedBox(
                        height: height / 16,
                      ),
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
                                  bgimagepath: "assets/images/soilHumidity.png",
                                  title: "Soil Humidity",
                                  iconpath: "assets/images/humidity.png",
                                  index: 0,
                                  value: controller.latestfeeddata!.field3,
                                ),
                                onTap: () {},
                              );
                            case 1:
                              return GestureDetector(
                                child: CardWidgetforSoil(
                                  bgimagepath:
                                      "assets/images/soilTemperature.png",
                                  title: "Soil Temperature",
                                  iconpath: "assets/images/temp.png",
                                  index: 1,
                                  value: controller.latestfeeddata!.field2,
                                ),
                                onTap: () {},
                              );
                            case 2:
                              return GestureDetector(
                                child: CardWidgetforSoil(
                                  bgimagepath: "assets/images/soilPhLevel.png",
                                  title: "Soil PH Level",
                                  iconpath: "assets/images/ph.png",
                                  index: 2,
                                  value: controller.latestfeeddata!.field7,
                                ),
                                onTap: () {},
                              );
                            case 3:
                              return GestureDetector(
                                child: CardWidgetforSoil(
                                  bgimagepath: "assets/images/soilNPK.png",
                                  title: "Soil NPK",
                                  iconpath: "assets/images/npk.png",
                                  index: 3,
                                  value: controller.latestfeeddata!.field7,
                                ),
                                onTap: () {},
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
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.red.withOpacity(0.1), BlendMode.dstATop),
                            image: const AssetImage(
                              "assets/images/BG.png",
                            ),
                            // opacity: .2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: height / 3,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.teal.withOpacity(.1),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),

                                          //! using dafault switch
                                          SlidingSwitch(
                                            contentSize: 14,
                                            value: false,
                                            width: 100,
                                            onChanged: (bool value) {
                                              controller.setpump(
                                                  pumpstatus: value);
                                            },
                                            height: 35,
                                            animationDuration: const Duration(
                                                milliseconds: 20),
                                            onTap: () {},
                                            onDoubleTap: () {},
                                            onSwipe: () {},
                                            textOff: "OFF",
                                            textOn: "ON",
                                            colorOn: const Color.fromARGB(
                                                255, 60, 205, 130),
                                            colorOff: const Color(0xffdc6c73),
                                            background: const Color.fromARGB(
                                                255, 113, 113, 114),
                                            buttonColor:
                                                const Color(0xfff7f5f7),
                                            inactiveColor: const Color.fromARGB(
                                                255, 58, 60, 62),
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
                                                value: controller
                                                    .pumpStatusmanually,
                                                activeColor: Colors.blue,
                                                onChanged: (bool value) {
                                                  // This is called when the user toggles the switch.
                                                  controller.setpumpmanually(
                                                      pumpstatus: value);
                                                },
                                              )
                                            ],
                                          ),
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
                                                              onChanged:
                                                                  (value) {
                                                                controller.updateSelectedVisualType(
                                                                    value: value
                                                                        as VisualType);
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
                                                                            padding:
                                                                                const EdgeInsets.only(left: 10),
                                                                            child: ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                                                onPressed: () {},
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
                                                              onChanged:
                                                                  (value) {
                                                                controller.updateSelectedVisualType(
                                                                    value: value
                                                                        as VisualType);
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
                                                                            padding:
                                                                                const EdgeInsets.only(left: 10),
                                                                            child: ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                                                onPressed: () {},
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
                                                              onChanged:
                                                                  (value) {
                                                                controller.updateSelectedVisualType(
                                                                    value: value
                                                                        as VisualType);
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
                                                                            padding:
                                                                                const EdgeInsets.only(left: 10),
                                                                            child: ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                                                                                onPressed: () {},
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





//!

