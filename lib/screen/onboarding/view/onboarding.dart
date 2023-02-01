import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/auth/sign_in/view/signin.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
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
                    height: 100,
                  ),
                  Image.asset(
                    'lib/images/onboadd.jpeg',
                  ),
                  const SizedBox(
                    height: 100,
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
                      'With long experience in the camera industry,\n      we create the best quality products',
                      style: TextStyle(color: greycolor),
                    ),
                  ),
                  kheight40,
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => SignIn(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kblackcolor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 45,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Center(
                            child: Text(
                              'GET STARTED',
                              style:
                                  TextStyle(color: kwhitecolor, fontSize: 13),
                            ),
                          ),
                          kwidth65,
                          Icon(
                            Icons.arrow_forward,
                            color: kwhitecolor,
                          ),
                          kwidth,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
