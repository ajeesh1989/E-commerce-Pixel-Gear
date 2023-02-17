import 'package:flutter/material.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Get.to(page);
        },
        child: Column(
          children: [
            Image.network(
                height: 80,
                fit: BoxFit.fill,
                '${apibaseurl.baseUrl}/category/${homeController.categoryList[index].image}'),
            // CircleAvatar(
            //   radius: 40,
            //   backgroundColor: kwhitecolor,
            //   backgroundImage: NetworkImage(
            //       '${apibaseurl.baseUrl}/category/${homeController.categoryList[index].image}'),
            // ),
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
