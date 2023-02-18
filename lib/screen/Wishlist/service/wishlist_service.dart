import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/screen/Wishlist/model/wishlist_model.dart';
import 'package:pixel_gear/util/api_intercepter/api_intercepter.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class WishlistService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<int?> addOrRemoveWishlist(productId) async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response =
          await dio.post(apibaseUrl.baseUrl + apiendUrl.wishlist, data: {
        'product': productId,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString(), name: 'wishlist 201');
        return response.statusCode;
      } else if (response.statusCode == 204) {
        log(response.statusCode.toString(), name: 'wishlist 204');
        return response.statusCode;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(
        e,
      );
    }
    return null;
  }

  Future<WishlistModel?> getWishlist() async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response =
          await dio.get(apibaseUrl.baseUrl + apiendUrl.wishlist);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final WishlistModel wishModel = WishlistModel.fromJson(response.data);
        return wishModel;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
