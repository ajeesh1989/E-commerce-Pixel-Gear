import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';
import '../../../otp_screen/service/varifyOtp.dart';
import '../../model/model.dart';
import '../../service/signUpService.dart';

class VerifyOtpController extends GetxController {
  final verifyOtpS = VerifyOtpService();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';

  void onSubmitCode(String submitCode) {
    log(submitCode, name: 'submitcode');
    code = submitCode;
    update();
  }

  void sumbitOtp(SignUpModel model, code) {
    if (code.length != 4) {
      Get.snackbar('OTP', 'Please enter the OTP', colorText: kblackcolor);
    } else {
      isLoading = true;
      update();
      verifyOtpS.verifyOtp(model.email, code).then(
        (value) {
          if (value != null) {
            SignUpService().signUpUser(model).then((value) {
              if (value != null) {
                log('message');
                storage.write(key: 'token', value: value.accessToken);
                storage.write(key: 'refreshToken', value: value.refreshToken);
                Get.offAll(() => BottomNavPage());
                isLoading = false;
                update();
              }
            });
          }
        },
      );
    }
  }
}
