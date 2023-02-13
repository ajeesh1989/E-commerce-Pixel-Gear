import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';
import 'package:pixel_gear/screen/auth/sign_in/view/signin.dart';

class SplashscreenController extends GetxController {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  String? splashvalue;
  String? signincheck;

  void splashTimer() {
    Timer(
      const Duration(seconds: 3),
      () async {
        splashvalue = await storage.read(key: 'splash');
        signincheck = await storage.read(key: 'token');

        if (signincheck != null) {
          Get.offAll(() => BottomNavPage());
        } else {
          if (splashvalue != null) {
            Get.offAll(() => SignIn());
          } else {
            Get.offAll(() => SignIn());
          }
        }
      },
    );
  }
}
