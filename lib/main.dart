import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';
import 'package:pixel_gear/screen/SplashScreen/view/splash.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends GetView {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    goToGetPage();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SplashScreen(),
    );
  }
}

Future<void> goToGetPage() async {
  await Future.delayed(const Duration(seconds: 5));

  Get.off(() => BottomNavPage());
}
