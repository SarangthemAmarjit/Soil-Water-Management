import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  _GifSplashScreenState createState() => _GifSplashScreenState();
}

class _GifSplashScreenState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      context.router.replaceNamed('/initial');
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Center(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SizedBox(
                height: 300,
                child: Image.asset(
                  'assets/images/splash.png',
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          SizedBox(
            height: screenheight / 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                        height: screenheight / 26,
                        child: Image.asset("assets/images/ihmLogo.png")),
                    const Text("Innovation Hub Manipur"),
                    const SizedBox(
                      height: 4,
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        height: screenheight / 26,
                        child: Image.asset("assets/images/logo.jpg")),
                    const Text("CubeTen technologies Pvt. Ltd."),
                    const SizedBox(
                      height: 4,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
