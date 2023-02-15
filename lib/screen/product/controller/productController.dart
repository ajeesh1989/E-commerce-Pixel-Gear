import 'package:get/get.dart';

class ProductController extends GetxController {
  int activeSize = 0;
  int activeCarousal = 0;

  void changeCarousalPosition(index) {
    activeCarousal = index;
    update();
  }
}
