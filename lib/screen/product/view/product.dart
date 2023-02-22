import 'package:pixel_gear/screen/Cart/controller/cart_controller.dart';
import 'package:pixel_gear/screen/Cart/view/cart.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Wishlist/view/wishlist.dart';
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
  final cartC = Get.put(CartController());

  double height = Get.size.height;
  double width = Get.size.width;
  final productC = Get.put(ProductController());
  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final findproduct = homeC.findById(productid);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          findproduct.name,
          style: const TextStyle(color: greycolor, fontSize: 25),
        ),
        backgroundColor: kwhitecolor,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => MyCart(height: height, width: width));
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: kblackcolor,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => WishlistPage(height: height, width: width));
            },
            child: const Text(
              'Wishlist',
              style: TextStyle(color: kblackcolor),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: kblackcolor,
          ),
        ),
        elevation: 0,
      ),
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
                productCc: productC,
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
              // Text(
              //   findproduct.name,
              //   style: const TextStyle(
              //       fontWeight: FontWeight.w500,
              //       fontSize: 20,
              //       color: greycolor),
              // ),
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
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Offer ${findproduct.offer.toString()}% off",
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      kwidth10,
                      Text(
                        "₹${findproduct.price - findproduct.discountPrice}",
                        style: const TextStyle(
                          fontSize: 26,
                          color: kblackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              kheight05,
              Row(
                children: [
                  const Text(
                    'M.R.P. :',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  kwidth10,
                  Text(
                    "₹${findproduct.price.toString()}",
                    style: const TextStyle(
                      fontSize: 22,
                      color: greycolor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
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
      bottomNavigationBar: ProductviewBottomNavwidget(
        productmodel: findproduct,
        height: height,
        width: width,
        size: findproduct.size[0],
        id: findproduct.id,
      ),
    );
  }
}
