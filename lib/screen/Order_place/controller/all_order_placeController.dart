import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/all_order_model.dart';
import '../service/all_orderService.dart';

class AllOrderController extends GetxController {
  bool isLoding = true;

  @override
  void onInit() {
    getorder();
    super.onInit();
  }

  List<AllOrder> orderList = [];
  void getorder() async {
    isLoding = true;
    update();
    await AllOrderService().getOrder().then((value) {
      if (value != null) {
        orderList = List.from(value.reversed);
        update();
        log(orderList[0].products[0].discountPrice.toString());

        isLoding = false;
        update();
      } else {
        return null;
      }
    });
  }
}
