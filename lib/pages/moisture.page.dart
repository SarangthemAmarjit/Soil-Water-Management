import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';

@RoutePage()
class MoisturePage extends StatelessWidget {
  const MoisturePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double scrrenheight = MediaQuery.of(context).size.height;
    GetxTapController controller = Get.put(GetxTapController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: Text(controller.soiltitle,
            style: const TextStyle(
                wordSpacing: 2,
                letterSpacing: 2,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: GetBuilder<GetxTapController>(builder: (_) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), BlendMode.dstATop),
                image: const AssetImage(
                  "assets/images/soil01.png",
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
                  const Text(
                    "Graphical view of Moisture level of soil",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: scrrenheight / 82,
                  ),
                  Container(
                    color: Colors.amber,
                    height: scrrenheight / 3,
                    child: const Center(
                      child: Text(
                        "GRAPH",
                        style: TextStyle(fontSize: 98),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
