import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int activeIndex = 0;
  bool isLoading = false;

  void smoothIndicator(index) {
    activeIndex = index;
    update();
  }
}
