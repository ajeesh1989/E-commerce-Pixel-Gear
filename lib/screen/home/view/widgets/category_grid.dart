import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/allproducts/all_products.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.apibaseurl,
    required this.homeController,
    required this.index,
  });
  final int index;

  final ApiBaseUrl apibaseurl;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final homeController2 = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          log('message');
          log(homeController2.categoryList[index].id);
          Get.to(() => AllProductsPage(categoryid: '63e9d346559f90a78c9f891c'));
        },
        child: Column(
          children: [
            Image.network(
                height: 80,
                fit: BoxFit.fill,
                '${apibaseurl.baseUrl}/category/${homeController.categoryList[index].image}'),
            const SizedBox(
              height: 4,
            ),
            Text(
              homeController.categoryList[index].name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
