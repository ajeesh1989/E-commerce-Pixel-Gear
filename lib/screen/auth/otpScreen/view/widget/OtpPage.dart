import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/auth/sign_up/controller/varificationOTP/controller.dart';
import 'package:pixel_gear/screen/auth/sign_up/model/model.dart';
import 'package:pixel_gear/screen/auth/sign_up/view/signup.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required this.height,
    required this.model,
    required this.width,
    required this.varifyOTPC,
  });

  final double height;
  final SignUpModel model;
  final double width;
  final VerifyOtpController varifyOTPC;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.050,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/otpAuth.avif',
              scale: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'OTP Authentication',
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(fontSize: 30),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            kheight05,
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'An authentication code has been sent to your\nemail : ${model.email}',
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Please enter your OTP below!',
                  style: TextStyle(color: Colors.black54, fontSize: 16)),
            ),
            kheight20,
            GetBuilder<VerifyOtpController>(
              builder: (controller) {
                return OtpTextField(
                    focusedBorderColor: kblackcolor,
                    fieldWidth: width * 0.165,
                    textStyle: const TextStyle(color: kblackcolor),
                    numberOfFields: 4,
                    borderColor: kblackcolor,
                    enabledBorderColor: kblackcolor,
                    borderRadius: BorderRadius.circular(10),
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      varifyOTPC.onSubmitCode(verificationCode);
                    });
              },
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GetBuilder<VerifyOtpController>(
                builder: (controller) => GestureDetector(
                  onTap: () {
                    varifyOTPC.sumbitOtp(
                      model,
                      varifyOTPC.code,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kblackcolor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: height * 0.06,
                    width: width * 0.9,
                    child: const Center(
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(color: kwhitecolor, fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Get.to(() => SignUp()),
              child: const Text(
                "Didn't get OTP? ",
                style: TextStyle(color: greycolor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
