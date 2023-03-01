import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/SplashScreen/Controller/splash_controller.dart';

class SplashScreen extends GetView {
  SplashScreen({super.key});

  final splashController = Get.put(SplashscreenController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashController.splashTimer();
    });
    return Scaffold(
      backgroundColor: kwhitecolor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Image.asset(
                    'lib/images/onboadd.jpeg',
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Welcome to Pixel Gear !',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'With long experience in the camera industry,\n      we create the best quality products.',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  kheight40,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
