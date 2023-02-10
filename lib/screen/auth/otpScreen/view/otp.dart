import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/screen/auth/sign_up/controller/varificationOTP/controller.dart';
import 'package:pixel_gear/screen/auth/sign_up/model/model.dart';
import '../../../../core/colors.dart';

class OTPscreen extends StatelessWidget {
  OTPscreen({required this.model, super.key});
  final SignUpModel model;
  final varifyOTPC = Get.put(VerifyOtpController());

  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'OTP Authentication',
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(fontSize: 30),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              kheight10,
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'An authentication code has been sent\nPlease enter your OTP',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
              kheight40,
              GetBuilder<VerifyOtpController>(
                builder: (controller) {
                  return OtpTextField(
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
              kHeight50,
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GetBuilder<VerifyOtpController>(
                  builder: (controller) => GestureDetector(
                    onTap: () {
                      varifyOTPC.sumbitOtp(model, varifyOTPC.code);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kblackcolor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 50,
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Center(
                            child: Text(
                              'CONTINUE',
                              style:
                                  TextStyle(color: kwhitecolor, fontSize: 13),
                            ),
                          ),
                          kwidthk,
                          Icon(
                            Icons.arrow_forward,
                            color: kwhitecolor,
                          ),
                          kwidth,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Get.to(() => const ForgotPassword());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(25.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: const [
              //         Text(
              //           "Didn't you recieved your OTP?",
              //           style: TextStyle(color: Colors.black54),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
