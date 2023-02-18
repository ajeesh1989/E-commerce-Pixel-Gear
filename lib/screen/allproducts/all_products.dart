import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/view/widgets/home_grid.dart';
import 'package:pixel_gear/screen/product/controller/productController.dart';

class AllProductsPage extends StatelessWidget {
  AllProductsPage({super.key});

  double height = Get.size.height;
  double width = Get.size.width;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kwhitecolor,
          centerTitle: true,
          title: const Text(
            'All Products',
            style: TextStyle(color: kblackcolor),
          ),
        ),
        body: SingleChildScrollView(
            child: HomeGrid(height: height, width: width)),
      ),
    );
  }
}
