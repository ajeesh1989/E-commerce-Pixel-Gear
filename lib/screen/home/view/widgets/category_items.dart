import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/view/widgets/category_grid.dart';
import 'package:pixel_gear/util/Box/box.dart';

import '../../../../core/colors.dart';

class CategoryWidget extends GetView {
  CategoryWidget({
    super.key,
    required this.height,
    required this.homeController,
  });

  final double height;

  final HomeController homeController;
  final apibaseurl = ApiBaseUrl();

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height * 0.17,
      child: Card(
        elevation: 5,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            homeController.categoryList.length,
            (index) {
              return CategoryGrid(
                  apibaseurl: apibaseurl,
                  homeController: homeController,
                  index: index);
            },
          ),
        ),
      ),
    );
  }
}
