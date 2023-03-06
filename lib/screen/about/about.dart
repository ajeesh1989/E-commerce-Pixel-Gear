import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';
import 'package:pixel_gear/util/Box/box.dart';

import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        centerTitle: true,
        // title: const Text(
        //   'About - P i x e l  G e a r',
        //   style: TextStyle(color: kblackcolor),
        // ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kblackcolor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => BottomNavPage());
              },
              icon: const Icon(
                Icons.home,
                color: kblackcolor,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'P i x e l  ',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.w300),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'G e a r',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\nOur app is dedicated to providing you with the best selection of cameras. We pride ourselves on offering a wide range of high-quality products at competitive prices, and our team is committed to delivering outstanding customer service.'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\nWe understand that buying a camera is an investment, and we want to ensure that you have all the information you need to make an informed decision. That is why we offer detailed product descriptions, customer reviews, and expert advice on our app.'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\nIn addition to our extensive selection of cameras, we also carry a range of accessories, including lenses, memory cards, tripods, and camera bags. We believe that these accessories can help you take your photography to the next level, and we are proud to offer a wide range of options to meet your needs.'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\nAt our PIXEL GEAR App, we strive to make your shopping experience as easy and enjoyable as possible. Our app is user-friendly, and we offer fast and reliable shipping to ensure that you receive your order promptly. If you have any questions or concerns, our customer service team is always available to assist you.'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\nThank you for choosing our PIXEL GEAR App for your photography needs. We look forward to serving you and helping you capture all of life is precious moments!'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () async {
                                launchUr(Uri.parse(
                                    'https://instagram.com/ajeesh_aj_abi?igshid=YmMyMTA2M2Y='));
                              },
                              icon: const Icon(FontAwesomeIcons.instagram)),
                          IconButton(
                              onPressed: () async {
                                launchUr(Uri.parse(
                                    'https://www.linkedin.com/in/ajeesh-das-h-601938128/'));
                              },
                              icon: const Icon(FontAwesomeIcons.linkedin)),
                          IconButton(
                              onPressed: () async {
                                launchUr(
                                    Uri.parse('https://github.com/ajeesh1989'));
                              },
                              icon: const Icon(FontAwesomeIcons.github)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Center(child: Text('version:1.0')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> launchUr(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch ';
    }
  }
}
