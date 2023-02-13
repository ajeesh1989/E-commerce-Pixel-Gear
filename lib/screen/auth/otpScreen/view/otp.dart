import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/auth/otpScreen/view/widget/OtpPage.dart';
import 'package:pixel_gear/screen/auth/sign_up/controller/varificationOTP/controller.dart';
import 'package:pixel_gear/screen/auth/sign_up/model/model.dart';

class OTPscreen extends StatelessWidget {
  OTPscreen({
    required this.model,
    super.key,
  });
  final SignUpModel model;
  final varifyOTPC = Get.put(VerifyOtpController());

  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return Scaffold(
      body: SafeArea(
        child: OtpWidget(
            height: height, model: model, width: width, varifyOTPC: varifyOTPC),
      ),
    );
  }
}
