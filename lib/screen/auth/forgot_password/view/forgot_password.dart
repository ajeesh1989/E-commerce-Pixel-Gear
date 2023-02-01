import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/screen/auth/otp_screen/view/otp.dart';
import '../../../../core/colors.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password Recovery',
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(fontSize: 30),
                  fontWeight: FontWeight.w500,
                ),
              ),
              kheight10,
              const Text(
                'Enter your email id to recover your password',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              kheight30,
              SizedBox(
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: kblackcolor,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: kblackcolor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: kblackcolor,
                      ),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: greycolor),
                  ),
                ),
              ),
              kheight30,
              GestureDetector(
                onTap: () {
                  Get.to(() => OTPscreen);
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
                          style: TextStyle(color: kwhitecolor, fontSize: 13),
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
            ],
          ),
        ),
      ),
    );
  }
}
