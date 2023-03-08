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

  String selectmonth = 'January';
  void monthDelivery(int month) {
    if (month == 1) {
      selectmonth = 'January';
    } else if (month == 2) {
      selectmonth = 'February';
    } else if (month == 3) {
      selectmonth = 'March';
    } else if (month == 4) {
      selectmonth = 'April';
    } else if (month == 5) {
      selectmonth = 'May';
    } else if (month == 6) {
      selectmonth = 'June';
    } else if (month == 7) {
      selectmonth = 'July';
    } else if (month == 8) {
      selectmonth = 'August';
    } else if (month == 9) {
      selectmonth = 'September';
    } else if (month == 10) {
      selectmonth = 'October';
    } else if (month == 11) {
      selectmonth = 'November';
    } else if (month == 12) {
      selectmonth = 'December';
    }
  }

  String selectmonthC = 'January';
  void monthCancel(int month) {
    if (month == 1) {
      selectmonthC = 'January';
    } else if (month == 2) {
      selectmonthC = 'February';
    } else if (month == 3) {
      selectmonthC = 'March';
    } else if (month == 4) {
      selectmonthC = 'April';
    } else if (month == 5) {
      selectmonthC = 'May';
    } else if (month == 6) {
      selectmonthC = 'June';
    } else if (month == 7) {
      selectmonthC = 'July';
    } else if (month == 8) {
      selectmonthC = 'August';
    } else if (month == 9) {
      selectmonthC = 'September';
    } else if (month == 10) {
      selectmonthC = 'October';
    } else if (month == 11) {
      selectmonthC = 'November';
    } else if (month == 12) {
      selectmonthC = 'December';
    }
  }
}
