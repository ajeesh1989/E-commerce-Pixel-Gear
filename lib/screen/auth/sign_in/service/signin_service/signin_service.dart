import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/screen/auth/sign_in/model/signin_model.dart';
import 'package:pixel_gear/screen/auth/sign_in/model/signin_token.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class SignInService {
  Dio dio = Dio();
  final apibaseurl = ApiBaseUrl();
  final apiendurl = ApiEndsUrl();
  SignInModel? signInModel;
  Future<SignInTokenModel?> signinUser(SignInModel model) async {
    try {
      Response response = await dio.post(
        apibaseurl.baseUrl + apiendurl.signIn,
        data: jsonEncode(
          model.tojson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // ignore: non_constant_identifier_names
        final SignInModel = SignInTokenModel.fromJson(response.data);
        log(response.data.toString());
        return SignInModel;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
