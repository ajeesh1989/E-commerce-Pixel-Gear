import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/view/widgets/category_grid.dart';
import 'package:pixel_gear/screen/allproducts/all_products.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  double height = Get.size.height;
  double width = Get.size.width;

  @override
  Widget build(BuildContext context) {
    final categoryitems = Get.put(HomeController());
    final apibaseurl = ApiBaseUrl();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kwhitecolor,
        title: const Text(
          'All Brands',
          style: TextStyle(color: kblackcolor),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => Column(children: [
          Expanded(
            child: GridView.builder(
              itemCount: categoryitems.categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    log('hello');
                    Get.to(() => AllProductsPage(
                        categoryid: categoryitems.categoryList[index].id));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        log('hello');
                        Get.to(() => AllProductsPage(
                              categoryid: categoryitems.categoryList[index].id,
                            ));
                      },
                      child: Card(
                        elevation: 15,
                        child: CategoryGrid(
                          apibaseurl: apibaseurl,
                          homeController: categoryitems,
                          index: index,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
