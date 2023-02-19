import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/model/productmodel.dart';
import 'package:pixel_gear/screen/Wishlist/controller/wishlist_controller.dart';
import 'package:pixel_gear/screen/product/controller/productController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductviewCarousalWidget extends StatelessWidget {
  ProductviewCarousalWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.productCc,
      required this.productmodel});

  final double height;
  final double width;
  final ProductController productCc;
  final ProductModel productmodel;
  final apibaseUrl = ApiBaseUrl();

  final productC = Get.put(
    HomeController(),
  );

  final wishlistcontroller = Get.put(
    WishListController(),
  );

  @override
  Widget build(BuildContext context) {
    final control = Get.put(ProductController());
    return GetBuilder<ProductController>(
      builder: (controller) => Stack(
        children: [
          CarouselSlider.builder(
            itemCount: productmodel.image.length,
            itemBuilder: (BuildContext context, int index, int realindex) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        '${apibaseUrl.baseUrl}/products/${productmodel.image[index]}'),
                  ),
                ),
                height: height * 0.2,
                width: width * 0.95,
              );
            },
            options: CarouselOptions(
              height: height * 0.40,
              aspectRatio: 1 / 6,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                productCc.changeCarousalPosition(index);
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Positioned(
            top: height * 0.0,
            left: width * 0.85,
            child: GetBuilder<WishListController>(
              builder: (controller) => IconButton(
                onPressed: () {
                  wishlistcontroller.addOrRemoveFromWishlist(productmodel.id);
                },
                icon: wishlistcontroller.wishList.isEmpty
                    ? const Icon(Icons.favorite_border_outlined)
                    : Icon(
                        wishlistcontroller.wishList.contains(productmodel.id)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: wishlistcontroller.wishList.isEmpty
                            ? kblackcolor
                            : wishlistcontroller.wishList
                                    .contains(productmodel.id)
                                ? kblackcolor
                                : Colors.black45,
                      ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.35,
            left: width * 0.40,
            child: AnimatedSmoothIndicator(
              activeIndex: productCc.activeCarousal,
              count: productmodel.image.length,
              effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Color.fromARGB(137, 245, 241, 241),
                  dotColor: Color.fromARGB(59, 240, 227, 227)),
            ),
          ),
        ],
      ),
    );
  }
}
