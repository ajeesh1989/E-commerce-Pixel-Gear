import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/model/productmodel.dart';
import 'package:pixel_gear/screen/product/widget/productViewBottomNav.dart';
import 'package:pixel_gear/screen/product/widget/productViewCarousal.dart';
import 'package:pixel_gear/screen/product/widget/productViewRating.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/product/controller/productController.dart';

class ProductScreen extends GetView {
  ProductScreen({
    super.key,
    required this.height,
    required this.width,
    required this.productid,
  });
  // static String routeName = '/product.dart';
  final String productid;

  double height = Get.size.height;
  double width = Get.size.width;
  final productC = Get.put(ProductController());
  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context)?.settings.arguments as String;
    final findproduct = homeC.findById(productid);
    return Scaffold(
      body: GetBuilder<ProductController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductviewCarousalWidget(
                productmodel: findproduct,
                height: height,
                width: width,
                productC: productC,
              ),
              kheight10,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductviewRating(
                  producm: findproduct,
                  productc: productC,
                ),
              ),
              kheight10,
              Text(
                findproduct.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: greycolor),
              ),
              kheight10,
              ReadMoreText(
                findproduct.description,
                style: const TextStyle(fontSize: 16),
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                moreStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                lessStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              kheight10,
              Row(
                children: [
                  Text(
                    "₹${findproduct.price.toString()}",
                    style: const TextStyle(
                      fontSize: 30,
                      color: kblackcolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kwidth,
                  Row(
                    children: [
                      // const Text(
                      //   "Price",
                      //   style: TextStyle(color: Colors.black38, fontSize: 18),
                      // ),
                      Text(
                        "Offer ${findproduct.offer.toString()}% off",
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              kheight05,
              const Text(
                'Free delivery',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          ProductviewBottomNavwidget(height: height, width: width),
    );
  }
}
