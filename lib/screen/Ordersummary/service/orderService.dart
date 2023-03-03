import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/api/api_endurl.dart';
import 'package:pixel_gear/util/api_intercepter/api_intercepter.dart';
import 'package:pixel_gear/util/dio_exception/exceptions.dart';
import 'package:pixel_gear/screen/Ordersummary/model/get_order.dart';
import 'package:pixel_gear/screen/Ordersummary/model/order_model.dart';

class OrderService {
  Future<String?> placeOrder(OrdersModel model) async {
    log('message', name: 'cart');
    log(model.paymentType, name: 'cart');
    final Dio dios = await ApiInterceptor().getApiUser();
    log('message2', name: 'cart');

    try {
      final Response response = await dios.post(
        ApiBaseUrl().baseUrl + ApiEndsUrl().order,
        data: model.toJson(),
      );
      log(response.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final GetOrderModel order =
              GetOrderModel.fromJson(response.data['order']);
          log(order.toString());
          return order.id;
        }
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      DioException().dioError(e);
    }
    return null;
  }
}
