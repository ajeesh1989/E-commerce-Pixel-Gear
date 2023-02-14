import 'package:get/get.dart';
import 'package:pixel_gear/screen/Home/model/carousalmodel.dart';
import 'package:pixel_gear/screen/Home/model/categorymodel.dart';
import 'package:pixel_gear/screen/Home/service/carousal_service.dart';
import 'package:pixel_gear/screen/Home/service/category_service.dart';

class HomeController extends GetxController {
  HomeController() {
    getCategory();
    getACarousal();
  }
  List<CategoryModel> categoryList = [];
  List<CarousalModel> carousalList = [];

  int activeIndex = 0;
  bool isLoading = false;
  CategoryService categoryS = CategoryService();
  CarousalService carousalS = CarousalService();

  void getCategory() async {
    isLoading = true;
    update();
    await categoryS.getCategoryService().then(
      (value) {
        if (value != null) {
          categoryList = value;
          update();
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
  }

  void getACarousal() async {
    isLoading = true;
    update();
    await carousalS.getCarousal().then((value) {
      if (value != null) {
        carousalList = value;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
    isLoading = false;
    update();
  }

  void smoothIndicator(index) {
    activeIndex = index;
    update();
  }
}
