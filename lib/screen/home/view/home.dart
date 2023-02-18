import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/view/cart.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/view/shimmers/carousalshimmer.dart';
import 'package:pixel_gear/screen/Home/view/shimmers/categoryshimmer.dart';
import 'package:pixel_gear/screen/Home/view/shimmers/productshimmer.dart';
import 'package:pixel_gear/screen/Home/view/widgets/carousal_padding.dart';
import 'package:pixel_gear/screen/Home/view/widgets/carousal_page.dart';
import 'package:pixel_gear/screen/Home/view/widgets/category_items.dart';
import 'package:pixel_gear/screen/Home/view/widgets/drawerWidget.dart';
import 'package:pixel_gear/screen/Home/view/widgets/home_grid.dart';
import 'package:pixel_gear/util/circularProgressWidget/circular_progress_widget.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({
    super.key,
  });

  final homeconntroller = Get.put(HomeController());

  double height = Get.size.height;
  double width = Get.size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .25,
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'P I X E L  G E A R',
          style: GoogleFonts.openSans(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(MyCart(
                height: height,
                width: width,
              ));
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: kwhitecolor,
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: GetBuilder<HomeController>(
        builder: (controller) => homeconntroller.isLoading == true
            ? ListView(
                children: const [
                  CarouselShimmer(),
                  CategoryShimmer(),
                  ProductShimmer(),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    CarousalPadding(
                      height: height,
                      homeconntroller: homeconntroller,
                      width: width,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Top selling brands',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.all(8.0),
                          //   child: Text(
                          //     '<<< slide left',
                          //     style: TextStyle(
                          //         fontSize: 13, color: Colors.black26),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    CategoryWidget(
                      homeController: homeconntroller,
                      height: height,
                    ),
                    kheight05,
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Top selling products',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    kheight05,
                    HomeGrid(
                      height: height,
                      width: width,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
