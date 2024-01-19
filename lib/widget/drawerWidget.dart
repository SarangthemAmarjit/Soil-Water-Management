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
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 219, 242, 226),
              // image: DecorationImage(
              //     image: AssetImage("assets/images/drawer.jpg"),
              //     opacity: .8,
              //     fit: BoxFit.cover),
            ),
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
                      // shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/splash.png"),
                          fit: BoxFit.scaleDown),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text("Contact us"),
            onTap: () {
              context.router.push(const ContactPage());
            },
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
    );
  }
}





//!

