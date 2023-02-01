import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/screen/auth/sign_up/model/model.dart';
import 'package:pixel_gear/screen/auth/sign_up/model/tocken_model.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class SignUpService {
  final dio = Dio();
  final baseurl = ApiBaseUrl();
  final endurl = ApiEndsUrl();

  Future<SignUpTokenModel?> signUpUser(SignUpModel signupmodel) async {
    log('signup user created successfully');
    try {
      log('try', name: 'Sign up came in try');
      Response response = await dio.post(
        baseurl.baseUrl + endurl.signUp,
        data: jsonEncode(
          signupmodel.tojson(),
        ),
      );
      log(response.statusCode.toString());
      log('signup completed in try', name: 'after try');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final signUpResponse = SignUpTokenModel.fromJson(response.data);
        return signUpResponse;
      } else {
        log(response.statusCode.toString(), name: 'error status code');
      }
    } on DioError catch (e) {
      log(e.message, name: 'dio error');
      DioException().dioError(e);
    }
    return null;
  }
}
