import 'package:flutter/material.dart';

class CardWidgetforSoil extends StatelessWidget {
  final String bgimagepath;
  final String title;
  final String iconpath;
  const CardWidgetforSoil({
    super.key,
    required this.bgimagepath,
    required this.title,
    required this.iconpath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(0.1), BlendMode.dstATop),
                    image: AssetImage(
                      bgimagepath,
                    ),
                    // opacity: .2,
                    fit: BoxFit.cover,
                  ),
                ),
                child: null /* add child content here */,
              ),
              // Container(
              //   padding:  EdgeInsets.all(8),
              //   color: Colors.teal[200],
              //   child: Image.asset(
              //     opacity: AlwaysStoppedAnimation(.2),
              //     "assets/images/soilHumidity.png",
              //     fit: BoxFit.fitWidth,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
          Container(
              color: Colors.teal[100],
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8),
              child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  )))
        ],
      ),
    );
  }
}
