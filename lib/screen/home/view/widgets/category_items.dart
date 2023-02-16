import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
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
      child: Box(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            homeController.categoryList.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // Get.to(page);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: kwhitecolor,
                        backgroundImage: NetworkImage(
                            '${apibaseurl.baseUrl}/category/${homeController.categoryList[index].image}'),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        homeController.categoryList[index].name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
