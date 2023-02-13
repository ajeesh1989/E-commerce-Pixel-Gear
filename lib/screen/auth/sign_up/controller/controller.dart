import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/auth/otpScreen/service/otpService.dart';
import 'package:pixel_gear/screen/auth/otpScreen/view/otp.dart';
import 'package:pixel_gear/screen/auth/sign_up/model/model.dart';
import 'package:pixel_gear/screen/auth/sign_up/service/signUpService.dart';

class SignUpController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  bool isLoading = false;
  final signups = SignUpService();

  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> addUser() async {
    isLoading = true;
    update();
    final signupmodel = SignUpModel(
        fullname: usernameController.text.trim(),
        email: emailController.text.trim(),
        // phone: phoneController.text.trim(),
        password: passwordController.text.trim());
    OtpServices().sendOtp(signupmodel.email).then((value) {
      if (value != null) {
        Get.to(() => OTPscreen(
              model: signupmodel,
            ));
        disposeTextfield();
      } else {
        return;
      }
    });
    isLoading = false;
    update();
  }

  void disposeTextfield() {
    // usernameController.clear();
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    confirmpasswordController.clear();
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else {
      return null;
    }
  }

  String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
    } else {
      return null;
    }
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }

  String? mobileValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length < 10) {
      return 'Invalid mobile number,make sure your entered 10 digits';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    }
    return null;
  }

  String? confirmpasswordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value != passwordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: kblackcolor,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: greycolor,
      );
      obscureText = true;
      update();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: greycolor,
      );
      obscureText = false;
      update();
    }
  }
}
