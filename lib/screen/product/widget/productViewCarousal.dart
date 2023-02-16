import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/screen/Home/model/productmodel.dart';
import 'package:pixel_gear/screen/product/controller/productController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductviewCarousalWidget extends StatelessWidget {
  ProductviewCarousalWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.productC,
      required this.productmodel});

  final double height;
  final double width;
  final ProductController productC;
  final ProductModel productmodel;
  final apibaseUrl = ApiBaseUrl();

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
              height: height * 0.45,
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
                productC.changeCarousalPosition(index);
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          Positioned(
            top: height * 0.02,
            left: width * 0.82,
            child: control.iconChange == 0
                ? IconButton(
                    onPressed: () => control.iconchange(1),
                    icon: Icon(Icons.favorite_outline))
                : IconButton(
                    onPressed: () {
                      control.iconchange(0);
                    },
                    icon: const Icon(Icons.favorite),
                  ),
          ),
          Positioned(
            top: height * 0.35,
            left: width * 0.40,
            child: AnimatedSmoothIndicator(
              activeIndex: productC.activeCarousal,
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
