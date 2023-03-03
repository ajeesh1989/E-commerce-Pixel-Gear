import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Order_place/controller/all_order_placeController.dart';
import 'package:pixel_gear/screen/orderDetails/service/orderDetail_service.dart';

class OrderDetailsController extends GetxController {
  final allorderController = Get.put(AllOrderController());

  bool isLoading = true;
  Future<void> cancelOrder(String orderId) async {
    isLoading = true;
    update();

    await OrderDetailService().cancelOrder(orderId).then((value) {
      if (value != null) {
        isLoading = false;
        update();
        allorderController.getorder();
        Get.snackbar('order Cancel', 'order Canceld Successfuly',
            colorText: kwhitecolor, backgroundColor: Colors.black87);
      } else {
        isLoading = false;
        update();
      }
    });
  }
}
