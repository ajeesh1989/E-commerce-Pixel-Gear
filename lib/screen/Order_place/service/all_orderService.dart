import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../api/api_baseurl.dart';
import '../../../api/api_endurl.dart';
import '../../../util/api_intercepter/api_intercepter.dart';
import '../../../util/dio_exception/exceptions.dart';
import '../model/all_order_model.dart';

class AllOrderService {
  final dio = Dio();
  final abaseUrl = ApiBaseUrl();
  final aendUrl = ApiEndsUrl();
  Future<List<AllOrder>?> getOrder() async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response = await dio.get(abaseUrl.baseUrl + aendUrl.order);
      log('response geted');
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('entered to if condition in statuscode');
        log(response.data.toString(), name: 'carousal resposnce');
        final List<AllOrder> orderListe = (response.data as List)
            .map(
              (e) => AllOrder.fromJson(e),
            )
            .toList();
        log(orderListe.length.toString());
        return orderListe;
      } else {
        log('entered in else case');
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(
        e,
      );
    }
    return null;
  }
}
