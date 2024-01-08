// ignore_for_file: prefer_null_aware_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soilmoisturedetector/controller/tapcontroller.dart';
import 'package:soilmoisturedetector/widget/radialindicator.dart';
import 'package:soilmoisturedetector/widget/chartdata.dart';

class CardWidgetforSoil extends StatelessWidget {
  final String bgimagepath;
  final String title;
  final String iconpath;
  final String? value;
  final int index;
  const CardWidgetforSoil({
    super.key,
    required this.bgimagepath,
    required this.title,
    required this.iconpath,
    required this.index,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    return GetBuilder<GetxTapController>(builder: (_) {
      return Card(
        elevation: 10,
        shadowColor: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.1), BlendMode.dstATop),
              image: AssetImage(
                bgimagepath,
              ),
              // opacity: .2,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  color: Colors.teal[100],
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        title,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ))),
              Flexible(
                child: index == 3
                    ? RadialData(
                        nitro: controller.latestfeeddata == null
                            ? null
                            : controller.latestfeeddata!.field4,
                        phos: controller.latestfeeddata == null
                            ? null
                            : controller.latestfeeddata!.field5,
                        potas: controller.latestfeeddata == null
                            ? null
                            : controller.latestfeeddata!.field6)
                    : RadialIndicatorSoil(
                        value: value,
                        index: index,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 25, child: Image.asset(iconpath)),
                    Text(
                      "Show more . .",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          /* add child content here */
        ),
      );
    });
  }
}
