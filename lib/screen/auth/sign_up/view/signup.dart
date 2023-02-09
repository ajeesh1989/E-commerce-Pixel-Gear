import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/auth/sign_in/view/signin.dart';
import 'package:pixel_gear/screen/auth/sign_up/controller/controller.dart';

class SignUp extends GetView<SignUpController> {
  SignUp({super.key});

  final signupController = Get.put(SignUpController());
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;
    final height = Get.size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.06),
          child: GetBuilder<SignUpController>(
            builder: (controller) => Form(
              key: formGlobalKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Getting Started',
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(fontSize: 30),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      kheight10,
                      const Text(
                        'Create an account to continue!',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      kheight30,
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          validator: ((value) =>
                              signupController.usernameValidation(value)),
                          controller: signupController.usernameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: kblackcolor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Username',
                            labelStyle: const TextStyle(color: greycolor),
                          ),
                        ),
                      ),
                      kheight10,
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: ((value) =>
                              signupController.emailValdation(value)),
                          controller: signupController.emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: kblackcolor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: greycolor),
                          ),
                        ),
                      ),
                      kheight10,
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              signupController.mobileValidation(value),
                          controller: signupController.phoneController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: kblackcolor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Phone number',
                            labelStyle: const TextStyle(color: greycolor),
                          ),
                        ),
                      ),
                      kheight10,
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: signupController.obscureText,
                          validator: ((value) =>
                              signupController.passwordValdation(value)),
                          controller: signupController.passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: kblackcolor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                signupController.visibility();
                              },
                              icon: signupController.icon,
                              color: greycolor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: greycolor),
                          ),
                        ),
                      ),
                      kheight10,
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: signupController.obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: ((value) =>
                              signupController.confirmpasswordValdation(value)),
                          controller:
                              signupController.confirmpasswordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: kblackcolor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                signupController.visibility();
                              },
                              icon: signupController.icon,
                              color: greycolor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(color: greycolor),
                          ),
                        ),
                      ),
                      kheight10,
                      const Text('By creating an account, you agree to our'),
                      kheight05,
                      const Text(
                        'Term & Conditions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      kheight20,
                      GestureDetector(
                        onTap: () {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            signupController.addUser();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kblackcolor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 50,
                          width: 350,
                          child: const Center(
                            child: Text(
                              'SIGN UP',
                              style:
                                  TextStyle(color: kwhitecolor, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     kwidth65,
                      //     const Text(
                      //       'Already have an account?',
                      //       style: TextStyle(color: Colors.black54),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         Get.off(() => SignIn());
                      //       },
                      //       child: const Text('Sign In'),
                      //     ),
                      //     kwidth
                      //   ],
                      // ),
                      kheight20,
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: const TextStyle(color: kblackcolor),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => SignIn()),
                                text: 'Sign in',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      kheight20,
                      Container(
                        decoration: BoxDecoration(
                          color: koffwhite,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 50,
                        width: 350,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            kwidth,
                            Image.asset(
                              'lib/images/google-logo-9808.png',
                              height: 35,
                            ),
                            const SizedBox(
                              width: 55,
                            ),
                            const Text(
                              'Connect with Google',
                              style:
                                  TextStyle(color: kblackcolor, fontSize: 15),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
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
