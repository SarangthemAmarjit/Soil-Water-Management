import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MoisturePage extends StatelessWidget {
  const MoisturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
