import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pixel_gear/screen/Home/view/widgets/home_grid.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  double height = Get.size.height;
  double width = Get.size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeGrid(height: height, width: width));
  }
}
