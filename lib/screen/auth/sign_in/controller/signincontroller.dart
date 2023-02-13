import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/auth/sign_in/model/signin_model.dart';
import 'package:pixel_gear/screen/auth/sign_in/service/signin_service/signin_service.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  SignInService signinsservice = SignInService();
  bool isLoading = false;
  void signIn() {
    isLoading = true;
    update();
    log('ghh');
    // ignore: non_constant_identifier_names
    final Signinmodel = SignInModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    signinsservice.signinCheckUser(Signinmodel).then(
      (value) {
        if (value != null) {
          storage.write(key: 'token', value: value.accessToken);
          storage.write(key: 'refreshToken', value: value.refreshToken);
          Get.offAll(() => BottomNavPage());
          disposeTextfield();
        }
      },
    );
    isLoading = false;
    update();
  }

  void disposeTextfield() {
    emailController.clear();
    passwordController.clear();
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    }
    return null;
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , Please enter correct email';
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
