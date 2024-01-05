import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:soilmoisturedetector/constant/constant.dart';
import 'package:soilmoisturedetector/widget/cardwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool pumpStatus = true;
  VisualType _timer = VisualType.fiveMins;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 16,
            ),
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
                          iconpath: "assets/images/humidity.png"),
                      onTap: () {},
                    );
                  case 1:
                    return GestureDetector(
                      child: CardWidgetforSoil(
                          bgimagepath: "assets/images/soilTemperature.png",
                          title: "Soil Temperature",
                          iconpath: "assets/images/temp.png"),
                      onTap: () {},
                    );
                  case 2:
                    return GestureDetector(
                      child: CardWidgetforSoil(
                          bgimagepath: "assets/images/soilPhLevel.png",
                          title: "Soil PH Level",
                          iconpath: "assets/images/ph.png"),
                      onTap: () {},
                    );
                  case 3:
                    return GestureDetector(
                      child: CardWidgetforSoil(
                          bgimagepath: "assets/images/soilNPK.png",
                          title: "Soil NPK",
                          iconpath: "assets/images/npk.png"),
                      onTap: () {},
                    );
                  default:
                }
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
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/pump.png",
                                      height: 40,
                                    ), // Icon(
                                    //   Icons.electrical_services_outlined,
                                    //   size: 32,
                                    //   color: Colors.amber,
                                    // ),
                                    const Text(
                                      "   Water Pump",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),

                                //! using dafault switch
                                SlidingSwitch(
                                  contentSize: 14,
                                  value: false,
                                  width: 100,
                                  onChanged: (bool value) {
                                    print(value);
                                  },
                                  height: 35,
                                  animationDuration:
                                      const Duration(milliseconds: 20),
                                  onTap: () {},
                                  onDoubleTap: () {},
                                  onSwipe: () {},
                                  textOff: "OFF",
                                  textOn: "ON",
                                  colorOn:
                                      const Color.fromARGB(255, 60, 205, 130),
                                  colorOff: const Color(0xffdc6c73),
                                  background:
                                      const Color.fromARGB(255, 113, 113, 114),
                                  buttonColor: const Color(0xfff7f5f7),
                                  inactiveColor:
                                      const Color.fromARGB(255, 58, 60, 62),
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
                                        Image.asset(
                                          "assets/images/timer.png",
                                          height: 40,
                                        ),
                                        const Text(
                                          "   Manual Timer",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    //! using dafault switch
                                    Switch(
                                      // This bool value toggles the switch.
                                      value: pumpStatus,
                                      activeColor: Colors.blue,
                                      onChanged: (bool value) {
                                        // This is called when the user toggles the switch.
                                        setState(() {
                                          pumpStatus = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                  VisualDensity.compact,
                                              activeColor: Colors.green,
                                              value: VisualType.fiveMins,
                                              groupValue: _timer,
                                              onChanged: (value) {
                                                setState(() {
                                                  _timer = value!;
                                                });
                                              }),
                                        ),
                                        const Text(
                                          '05 mins',
                                          style: TextStyle(fontSize: 17),
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
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              activeColor: Colors.green,
                                              toggleable: true,
                                              value: VisualType.tenMins,
                                              groupValue: _timer,
                                              onChanged: (value) {
                                                setState(() {
                                                  _timer = value!;
                                                });
                                              }),
                                        ),
                                        const Text(
                                          '10 mins',
                                          style: TextStyle(fontSize: 17),
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
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              activeColor: Colors.green,
                                              value: VisualType.fifteenMins,
                                              groupValue: _timer,
                                              onChanged: (value) {
                                                setState(() {
                                                  _timer = value!;
                                                });
                                              }),
                                        ),
                                        const Text(
                                          '15 mins',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
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
  }
}





//!

