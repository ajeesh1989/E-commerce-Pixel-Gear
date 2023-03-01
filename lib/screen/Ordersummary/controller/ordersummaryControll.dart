import 'package:get/get.dart';

class OrderCOntrollerSummery extends GetxController {
  int index = 0;

  @override
  void onInit() {
    index = 0;
    update();
    super.onInit();
  }

  void indexChange(value) {
    index = value;
    update();
  }
}
