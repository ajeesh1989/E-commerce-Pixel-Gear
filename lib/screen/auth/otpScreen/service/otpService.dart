import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class OtpServices {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> sendOtp(email) async {
    try {
      log('otp enabled');
      Response response = await dio.get(
        apibaseUrl.baseUrl + apiendUrl.verifyOtp,
        queryParameters: {"email": email},
      );

      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp created');
        log('otp done');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message, name: 'status code');
      log('otp failed');
      DioException().dioError(e);
    }
    return null;
  }
}
