// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
// import 'package:pixel_gear/screen/product/model/product_model.dart';

// class SearchController extends GetxController {
//   HomeController homeController = Get.put(HomeController());
//   late List<ProductModel> productList = homeController.productList;
//   List<ProductModel> foundItems = [];

//   void itemsLoading() {
//     foundItems = productList;
//     update();
//   }

//   void search(String enteredKeyword) {
//     List<ProductModel> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = productList;
//     } else {
//       results = productList
//           .where((element) =>
//               element.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//     }
//     foundItems = results;
//     update();
//   }
// }