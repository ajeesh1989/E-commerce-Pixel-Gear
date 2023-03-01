import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../api/api_baseurl.dart';
import '../../../api/api_endurl.dart';
import '../../../util/api_intercepter/api_intercepter.dart';
import '../../../util/dio_exception/exceptions.dart';
import '../model/get_order.dart';
import '../model/order_model.dart';

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
      log('message3', name: 'cart');
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
