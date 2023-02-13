import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class VerifyOtpService {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> verifyOtp(email, otpCode) async {
    try {
      final Response response = await dio.post(
        apibaseUrl.baseUrl + apiendUrl.verifyOtp,
        data: {
          'email': email,
          'otp': otpCode,
        },
      );
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp verified');
        log(response.data.toString(), name: 'ver respo');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message);
      log('verification failed');
      DioException().dioError(e);
    }
    return null;
  }
}
