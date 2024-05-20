import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soilmoisturedetector/router/router.gr.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.1,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg.png'))),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              // color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 100,
                      margin: const EdgeInsets.only(top: 30, bottom: 10),
                      decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/splash.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.call,
                color: Colors.black,
              ),
              title: const Text(
                "Contact us",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.router.push(const ContactPage());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.thumb_up_alt_outlined,
                color: Colors.black,
              ),
              title: const Text(
                "Special Thanks",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
              title: const Text(
                "About",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}





//!

