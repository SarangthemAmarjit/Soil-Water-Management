import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 219, 242, 226),
            title: Text('Contact Info',
                style: TextStyle(
                  wordSpacing: 2,
                  letterSpacing: 2,
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width / 20,
                  fontWeight: FontWeight.bold,
                  // shadows: const <Shadow>[
                  //   Shadow(
                  //     offset: Offset(2.0, 2.0),
                  //     blurRadius: 2.0,
                  //     color: Colors.white,
                  //   ),
                  // ],
                )),
            centerTitle: true,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.2,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/bg.png'))),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                margin:
                                    const EdgeInsets.only(top: 30, bottom: 50),
                                decoration: const BoxDecoration(
                                  // shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/logopng.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          child: const ListTile(
                            leading: Icon(
                              Icons.phone_android_outlined,
                              size: 42,
                              color: Colors.blue,
                            ),
                            title: Text("+91 8794962564"),
                          ),
                          onTap: () async {
                            // await launch("tel:+917005843058");  //working but 'launch' is deprecated

                            final Uri launchUri =
                                Uri(scheme: 'tel', path: "+91 8794962564");
                            await launchUrl(launchUri);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: const ListTile(
                            leading: Icon(
                              FontAwesomeIcons.whatsapp,
                              size: 42,
                              color: Colors.green,
                            ),
                            title: Text("+91 8794962564"),
                          ),
                          onTap: () {
                            launchUrlString(
                                'whatsapp://send?text=sample text&phone=+91 8794962564');
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: const ListTile(
                            leading: Icon(
                              Icons.mail_outline,
                              size: 42,
                              color: Colors.red,
                            ),
                            title: Text("contact@cubeten.com"),
                          ),
                          onTap: () async {
                            String email = "contact@cubeten.com";
                            final Uri launchUri =
                                Uri(scheme: 'mailto', path: email);
                            await launchUrl(launchUri);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'contact us  for any queries, tips, suggestions and support.',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "About us: \n  ",
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "We are a dynamic group of creative individuals. We are the ideal solution. CubeTen started off with the vision of making IT one of the primary driving forces in people's lives, enabling and empowering everyone in all aspects of their lives, including education, health, finance, and day-to-day ENDEAVOUR. We are also an empanelled organisation by the Department of Information Technology, Government of Manipur, for the development of software/web applications.",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    }
  }
}
