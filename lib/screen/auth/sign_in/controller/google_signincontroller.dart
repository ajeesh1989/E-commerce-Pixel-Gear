import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pixel_gear/screen/auth/sign_in/service/google_signin/google_signin.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';

class GoogleSigninController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;
  void googleSignin() async {
    isLoading = true;
    update();
    // ignore: avoid_types_as_parameter_names
    await GoogleSignInService.googleSignIn(googleSignIn).then((Value) {
      if (Value != null) {
        log(Value.toString());
        Get.offAll(() => BottomNavPage());
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        return;
      }
    });
  }
}
