import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/screen/Home/model/carousalmodel.dart';
import 'package:pixel_gear/util/api_intercepter/api_intercepter.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class CarousalService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<List<CarousalModel>?> getCarousal() async {
    Dio dio = await ApiInterceptor().getApiUser();

    try {
      Response response =
          await dio.get(apibaseUrl.baseUrl + apiendUrl.carousal);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<CarousalModel> carousallist = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        return carousallist;
      } else {
        return null;
      }
    } on DioError catch (e) {
      DioException().dioError(e);
    }
    return null;
  }
}
