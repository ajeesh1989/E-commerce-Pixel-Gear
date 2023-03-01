import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/SplashScreen/view/splash.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    enabled: false,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (BuildContext context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: SplashScreen());
  }
}

// Future<void> goToGetPage() async {
//   await Future.delayed(const Duration(seconds: 5));

//   Get.off(() => BottomNavPage());
// }
