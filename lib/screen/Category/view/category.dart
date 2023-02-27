import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/view/widgets/category_grid.dart';
import 'package:pixel_gear/screen/allproducts/all_products.dart';

class CategoryPage extends GetView {
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
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => AllProductsPage(
                              categoryid:
                                  categoryitems.categoryList[index].id));
                        },
                        child: Image.network(
                            fit: BoxFit.fill,
                            '${apibaseurl.baseUrl}/category/${categoryitems.categoryList[index].image}'),
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
