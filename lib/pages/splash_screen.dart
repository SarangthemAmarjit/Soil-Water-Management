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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
            height: 300,
            child: Image.asset(
              'assets/images/splash.gif',
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )),
    );
  }
}
