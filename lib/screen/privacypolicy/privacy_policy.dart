import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        centerTitle: true,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: kblackcolor),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kblackcolor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Introduction',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\nPixel Gear E-commerce App is committed to protecting the privacy of our users. This Privacy Policy describes how we collect, use, and disclose information about users of our mobile application (the "App").'),
              ),
              Text(
                '\nInformation We Collect',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Text(
                '\n\nWe collect the following information when you use our App:',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n1.Personal Information: When you create an account, we may collect your name, email address, phone number, billing and shipping addresses, and payment information.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n2.Device Information: We may collect information about your device, including the type of device you use, operating system version, and the device identifier.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n3.Usage Information: We may collect information about how you use our App, including the pages you view, the time you spend on each page, and the actions you take.'),
              ),
              Text(
                '\nHow We Use Your Information',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Text(
                '\n\nWe use the information we collect to:',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n1.Process and fulfill orders you place through the App.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n2.Provide customer service and support.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n3.Improve our App and develop new products and services.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n4.Personalize your experience on our App.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n5.Communicate with you about our products, services, promotions, and special offers.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n6.Detect and prevent fraud and other illegal activities.'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    '\n7.Comply with legal and regulatory requirements.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
