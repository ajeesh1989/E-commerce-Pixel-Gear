import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/util/api_intercepter/api_intercepter.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';

class OrderDetailService {
  Future<String?> cancelOrder(orderId) async {
    try {
      final Dio dios = await ApiInterceptor().getApiUser();
      final Response response = await dios.patch(
        "${ApiBaseUrl().baseUrl + ApiEndsUrl().order}/$orderId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final order = response.data['message'];
          log(order.toString());

          return order;
        }
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }
}
