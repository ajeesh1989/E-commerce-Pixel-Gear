import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        centerTitle: true,
        title: const Text(
          'Terms and Conditions',
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
                '1.Acceptance of Terms',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    textAlign: TextAlign.justify,
                    'By using the Pixel Gear app, you agree to be bound by these terms and conditions, as well as our privacy policy. If you do not agree to these terms and conditions,please do not use our app.'),
              ),
              Text(
                '\n2.Use of the App',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  'Pixel Gear allows users to browse and purchase products through our app. You may only use our app for lawful purposes and in accordance with these terms and conditions. You agree not to use our app in any way that violates any applicable federal, state, local, or international law or regulation.',
                ),
              ),
              Text(
                '\n3.Account Creation',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  'In order to use certain features of the Pixel Gear app, you may be required to create an account. You agree to provide accurate and complete information when creating an account, and to keep your account information up to date. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.',
                ),
              ),
              Text(
                '\n4.Products and Prices',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  'Pixel Gear offers a variety of products for sale through our app. We make every effort to ensure that the products and prices listed on our app are accurate and up to date, but we do not guarantee that all information is error-free. Prices are subject to change without notice.',
                ),
              ),
              Text(
                '\n5.Payment and Shipping',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  'Pixel Gear accepts various forms of payment, including credit cards and PayPal. We use standard shipping methods to deliver our products. Shipping times may vary depending on the shipping method you select and your location.',
                ),
              ),
              Text(
                '\n6.Returns and Refunds',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  'If you are not satisfied with a product you purchased through the Pixel Gear app, you may return it for a refund within 30 days of purchase. Please see our Returns and Refunds policy for more information.',
                ),
              ),
              Text(
                '\n7.Intellectual Property',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  'All content on the Pixel Gear app, including text, graphics, logos, images, and software, is the property of Pixel Gear or its content suppliers and is protected by copyright, trademark, and other intellectual property laws. You may not use any content from our app without our express written permission.',
                ),
              ),
              Text(
                '\n8.Disclaimer of Warranties',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  'Pixel Gear makes no representations or warranties of any kind, express or implied, as to the operation of our app or the information, content, materials, or products included on our app. To the full extent permissible by applicable law, Pixel Gear disclaims all warranties, express or implied, including but not limited to implied warranties of merchantability and fitness for a particular purpose.',
                ),
              ),
              Text(
                '\n9.Changes to Terms and Conditions',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  'Pixel Gear reserves the right to update or modify these terms and conditions at any time without prior notice. Your continued use of the Pixel Gear app following any such changes constitutes your acceptance of the new terms and conditions.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
