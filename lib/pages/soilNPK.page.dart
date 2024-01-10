import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:soilmoisturedetector/widget/drawerWidget.dart';

@RoutePage()
class SoilNpkPage extends StatelessWidget {
  const SoilNpkPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text(
          "Soil N P K",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
                color: Colors.green,
              ),
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 3.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      // drawer: const drawerWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.7), BlendMode.dstATop),
                image: const AssetImage(
                  "assets/images/BGspray.png",
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
                  SizedBox(
                    height: screenheight / 82,
                  ),
                  Opacity(
                    opacity: .4,
                    child: Container(
                      color: Colors.amber,
                      height: screenheight / 2.5,
                      child: const Center(
                        child: Text(
                          "GRAPH",
                          style: TextStyle(fontSize: 98),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight / 82,
                  ),
                  Opacity(
                    opacity: .5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      // color: Colors.white,
                      height: screenheight / 2,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenheight / 82,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.history,
                                  size: screenWidth / 12,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "HISTORY",
                                    style: TextStyle(
                                        fontSize: screenWidth / 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenheight / 82,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.orange,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                // height: 40,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: screenheight / 82,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                fontSize: screenWidth / 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'N',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            screenWidth / 20,
                                                        color:
                                                            Colors.red[900])),
                                                const TextSpan(text: 'itrogen'),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'P',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            screenWidth / 20,
                                                        color:
                                                            Colors.red[900])),
                                                const TextSpan(
                                                    text: 'hosporous'),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'P',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            screenWidth / 20,
                                                        color:
                                                            Colors.red[900])),
                                                const TextSpan(
                                                    text: 'otassium'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6, horizontal: 32.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "00.0$index",
                                                  style: TextStyle(
                                                      color: index % 2 == 1
                                                          ? Colors.black
                                                          : Colors.blueGrey,
                                                      fontSize:
                                                          screenWidth / 20),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16.0),
                                                  child: Text(
                                                    "Nitro$index",
                                                    style: TextStyle(
                                                        color: index % 2 == 1
                                                            ? Colors.black
                                                            : Colors.blueGrey,
                                                        fontSize:
                                                            screenWidth / 20),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16.0),
                                                  child: Text(
                                                    "Phos$index",
                                                    style: TextStyle(
                                                        color: index % 2 == 1
                                                            ? Colors.black
                                                            : Colors.blueGrey,
                                                        fontSize:
                                                            screenWidth / 20),
                                                  ),
                                                ),
                                                Text(
                                                  "Potas$index",
                                                  style: TextStyle(
                                                      color: index % 2 == 1
                                                          ? Colors.black
                                                          : Colors.blueGrey,
                                                      fontSize:
                                                          screenWidth / 20),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
