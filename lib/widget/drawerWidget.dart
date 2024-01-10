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
                      // shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.jpg"),
                          fit: BoxFit.scaleDown),
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
                            color: Colors.black,
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

