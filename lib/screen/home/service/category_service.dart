import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/screen/Home/model/categorymodel.dart';
import 'package:pixel_gear/util/api_intercepter/api_intercepter.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class CategoryService {
  final apiBaseUrl = ApiBaseUrl();
  final apiEndUrl = ApiEndsUrl();

  Future<List<CategoryModel>?> getCategoryService() async {
    Dio dio = await ApiInterceptor().getApiUser();

    try {
      Response response =
          await dio.get(apiBaseUrl.baseUrl + apiEndUrl.category);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<CategoryModel> categorylist = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        log(categorylist[0].id);

        return categorylist;
      } else {
        return null;
      }
    } on DioError catch (e) {
      DioException().dioError(e);
    }
    return null;
  }
}
