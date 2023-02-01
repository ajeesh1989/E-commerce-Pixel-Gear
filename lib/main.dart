import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/auth/sign_in/view/signin.dart';
import 'package:pixel_gear/screen/onboarding/view/onboarding.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: OnBoarding(),
    );
  }
}
