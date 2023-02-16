import 'package:get/get.dart';

class ProductController extends GetxController {
  int activeSize = 0;
  int activeCarousal = 0;
  int iconChange = 1;

  void changeCarousalPosition(index) {
    activeCarousal = index;
    update();
  }

  void iconchange(val) {
    iconChange = val;
    update();
  }
}
