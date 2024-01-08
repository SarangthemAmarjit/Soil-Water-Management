import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MoisturePage extends StatelessWidget {
  const MoisturePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text(
          "Soil Moisture",
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: BackButton(),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: AssetImage("assets/images/drawer.jpg"),
                      opacity: .68,
                      fit: BoxFit.cover)),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              // color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 30, bottom: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const Material(
                      color: Colors.transparent,
                      elevation: 5,
                      child: Text(
                        "Smart Irrigation System",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 2.0,
                              color: Colors.red,
                            ),
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 3.0,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.alternate_email),
              title: const Text("Contact us"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.thumb_up_alt_outlined),
              title: const Text("Special Thanks"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("About"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.dstATop),
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.history,
                                  size: 52,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "HISTORY",
                                    style: TextStyle(
                                        fontSize: 52,
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
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Moisture Level",
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                              leading:
                                                  const Icon(Icons.av_timer),
                                              trailing: const Padding(
                                                padding: EdgeInsets.only(
                                                    right: 28.0),
                                                child: Text(
                                                  "sample",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              title: Text("List item $index"));
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
