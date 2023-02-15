import 'package:get/get.dart';
import 'package:pixel_gear/screen/Home/model/carousalmodel.dart';
import 'package:pixel_gear/screen/Home/model/categorymodel.dart';
import 'package:pixel_gear/screen/Home/model/productmodel.dart';
import 'package:pixel_gear/screen/Home/service/carousal_service.dart';
import 'package:pixel_gear/screen/Home/service/category_service.dart';
import 'package:pixel_gear/screen/Home/service/product_service.dart';

class HomeController extends GetxController {
  HomeController() {
    getCategory();
    getACarousal();
    getProduct();
  }
  List<CategoryModel> categoryList = [];
  List<CarousalModel> carousalList = [];
  List<ProductModel> productList = [];

  int activeIndex = 0;
  bool isLoading = false;
  CategoryService categoryS = CategoryService();
  CarousalService carousalS = CarousalService();
  ProductService productS = ProductService();

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

  void getProduct() async {
    isLoading = true;
    update();
    await productS.getProduct().then((value) {
      if (value != null) {
        productList = value;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
  }

  void smoothIndicator(index) {
    activeIndex = index;
    update();
  }
}
