import 'package:flutter/material.dart';
import 'package:soilmoisturedetector/model/radialindicator.dart';
import 'package:soilmoisturedetector/widget/chartdata.dart';

class CardWidgetforSoil extends StatelessWidget {
  final String bgimagepath;
  final String title;
  final String iconpath;
  final int index;
  const CardWidgetforSoil({
    super.key,
    required this.bgimagepath,
    required this.title,
    required this.iconpath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.2), BlendMode.dstATop),
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
                  ? const RadialData(nitro: '', phos: '', potas: '')
                  : const RadialIndicatorSoil(
                      value: '70',
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
  }
}
