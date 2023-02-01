import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/auth/forgot_password/view/forgot_password.dart';
import 'package:pixel_gear/screen/auth/sign_in/controller/signincontroller.dart';
import 'package:pixel_gear/screen/auth/sign_up/view/signup.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  bool passwordVisible = false;
  final signinController = Get.put(SignInController());
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;
    final height = Get.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GetBuilder<SignInController>(
            builder: (controller) => SingleChildScrollView(
              child: Form(
                key: formGlobalKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.10),
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      kHeight50,
                      TextFormField(
                        controller: signinController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            signinController.emailValdation(value),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: kblackcolor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: kblackcolor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: greycolor),
                              borderRadius: BorderRadius.circular(20)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: greycolor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: redcolor),
                              borderRadius: BorderRadius.circular(20)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: redcolor),
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: greycolor),
                        ),
                      ),
                      kheight20,
                      TextFormField(
                        controller: signinController.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            signinController.passwordValidation(value),
                        obscureText: signinController.obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: greycolor),
                          filled: true,
                          fillColor: Colors.white70,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kblackcolor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              signinController.visibility();
                            },
                            icon: signinController.icon,
                            color: kblackcolor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: kblackcolor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: greycolor),
                              borderRadius: BorderRadius.circular(20)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: greycolor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: redcolor),
                              borderRadius: BorderRadius.circular(20)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: redcolor),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const ForgotPassword());
                            },
                            child: const Text(
                              'forgot password?',
                              style: TextStyle(color: greycolor),
                            ),
                          ),
                          kwidth
                        ],
                      ),
                      kheight80,
                      GestureDetector(
                        onTap: () {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            signinController.signIn();
                          }
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
                                  'SIGN IN',
                                  style: TextStyle(
                                      color: kwhitecolor, fontSize: 13),
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
                      kheight30,
                      Container(
                        decoration: BoxDecoration(
                          color: koffwhite,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 50,
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'lib/images/google-logo-9808.png',
                              height: 35,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Connect with Google',
                              style:
                                  TextStyle(color: kblackcolor, fontSize: 15),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: kblackcolor,
                            ),
                          ],
                        ),
                      ),
                      kheight40,
                      Row(
                        children: [
                          kwidth80,
                          const Text(
                            'Dont have any account?',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => SignUp());
                              },
                              child: const Text('Sign Up'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
