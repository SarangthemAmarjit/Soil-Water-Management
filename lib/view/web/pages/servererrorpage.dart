import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ServerErrorPage extends StatelessWidget {
  const ServerErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/noserver.png',
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Server Error 404',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      )),
    );
  }
}
