import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/screen/Home/model/categorymodel.dart';
import 'package:pixel_gear/util/api_intercepter/api_intercepter.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class CategoryService {
  final apibaseurl = ApiBaseUrl();
  final apiendurl = ApiEndsUrl();

  Future<List<CategoryModel>?> getCategory() async {
    log('came service');
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response =
          await dio.get(apibaseurl.baseUrl + apiendurl.category);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString(), name: 'responce');
        final List<CategoryModel> listCategory = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        log('set category');

        return listCategory;
      } else {
        return null;
      }
    } on DioError catch (e) {
      // log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
