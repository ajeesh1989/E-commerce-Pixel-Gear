import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/screen/EditAddress/model/edit_model.dart';

import '../../../util/api_intercepter/api_intercepter.dart';
import '../../../util/dio_exception/exceptions.dart';

class Editservice {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> updateAddress(
      EditAddressModel model, String addressId) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      log('try');
      final Response response = await dios.patch(
        "${apibaseUrl.baseUrl + apiendUrl.address}/$addressId",
        data: model.toJson(),
      );
      log('response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString());
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
