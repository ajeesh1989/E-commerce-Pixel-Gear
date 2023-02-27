import 'dart:developer';

import 'package:flutter/cupertino.dart';
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
    searchs('');
  }
  List<CategoryModel> categoryList = [];
  List<CarousalModel> carousalList = [];
  List<ProductModel> productList = [];
  List<ProductModel> searchResult = [];

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
          log(value.toString(), name: 'categoryList');
          categoryList = value;
          update();
          isLoading = false;
          update();
          log(categoryList[0].id);
        } else {
          isLoading = false;
          update();
        }
      },
    );
  }

  // void toProdutScreen(index) {
  //   Get.toNamed(ProductScreen.routeName, arguments: productList[index].id);
  // }

  ProductModel findById(String id) {
    return productList.firstWhere((element) => element.id == id);
  }

  List<ProductModel> findByCategoryId(String categoryId) {
    log('findByCategoryid');
    return productList
        .where((element) => element.category.contains(categoryId))
        .toList();
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

  TextEditingController searchController = TextEditingController();
  // void search(String keyboard) {
  //   List<ProductModel> results = [];
  //   if (keyboard.isEmpty) {
  //     results = productList;
  //   } else {
  //     results = productList
  //         .where(
  //           (element) => element.name.toLowerCase().contains(
  //                 keyboard.toLowerCase(),
  //               ),
  //         )
  //         .toList();
  //   }

  //   searchResult = results;
  //   update();
  // }

  void smoothIndicator(index) {
    activeIndex = index;
    update();
  }

  void searchs(String keyboard) {
    isLoading = true;
    update();
    List<ProductModel> results = [];
    if (keyboard.isEmpty) {
      results = productList;
    } else {
      results = productList
          .where(
            (element) => element.name.toLowerCase().contains(
                  keyboard.toLowerCase(),
                ),
          )
          .toList();
      update();
    }
    // log(results[0].name);

    searchResult = results;
    update();
    isLoading = false;
    update();
  }
}
