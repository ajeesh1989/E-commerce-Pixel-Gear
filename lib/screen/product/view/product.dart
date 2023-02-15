import 'dart:developer';
import 'package:readmore/readmore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pixel_gear/screen/product/controller/productController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({
    super.key,
    required this.height,
    required this.width,
  });

  double height = Get.size.height;
  double width = Get.size.width;
  final productC = Get.put(ProductController());

  List<String> images = [
    "https://petapixel.com/assets/uploads/2022/09/canon-5d-mark-iv-dslr.jpg",
    "https://i.insider.com/54f8aef5eab8ea9a6d6eb466?width=976&format=jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJG0gvJ3jT45BarQ0t7lY4fJ5mpyB6n_LzmfWP7fVQVY7mquPPJDEfVvMegnWSnI_K7Uk&usqp=CAU",
    "https://shotkit.com/wp-content/uploads/2020/07/Fuji-X100V.jpg",
    "https://cdn.britannica.com/67/92867-050-BC3DC984/cameras-camera-reviews-crystal-displays-photographs-film.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductviewCarousalWidget(
                images: images,
                height: height,
                width: width,
                productC: productC,
              ),
              ProductviewRating(),
              const ReadMoreText(
                'Excellent Camera for beginner photographer who are using mobile for photography and are looking to upgrade their skills. Buy with 18-135 lens + sigma 100-400 or 55-210+ 30/16 sigma prime lens for better usability',
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                moreStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '₹45000',
                  style: TextStyle(
                    fontSize: 25,
                    color: kblackcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          ProductviewBottomNavwidget(height: height, width: width),
    );
  }
}

class ProductviewBottomNavwidget extends StatelessWidget {
  const ProductviewBottomNavwidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: double.infinity,
      color: const Color.fromARGB(255, 233, 227, 227),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.4, height * 0.08),
              maximumSize: Size.fromHeight(height * 0.1),
              backgroundColor: Colors.grey.shade700,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {
              // cartC.addToCart(contorlle.id, contorlle.size.toString());
              // Get.to(() => ScreenOrder());
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: kwhitecolor,
            ),
            label: const Text(
              'Add Cart',
              style: TextStyle(
                color: kwhitecolor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(width * 0.4, height * 0.08),
                backgroundColor: Colors.grey.shade700,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              // Get.to(
              //   () => ScreenOrderSummery(
              //     height: height,
              //     width: width,
              //   ),
              // );
            },
            child: const Text(
              'Buy now',
              style: TextStyle(
                fontSize: 17,
                color: kwhitecolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductviewRating extends StatelessWidget {
  const ProductviewRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: '4.5',
            style: const TextStyle(color: kblackcolor),
            children: [
              WidgetSpan(
                child: RatingBar.builder(
                  initialRating: double.parse("4.5"),
                  itemSize: 15,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (startRating) {
                    log(startRating.toString());
                  },
                ),
              ),
            ],
          ),
        ),
        const Text(
          'In stock',
          style: TextStyle(color: Colors.green),
        )
      ],
    );
  }
}

class ProductviewCarousalWidget extends StatelessWidget {
  const ProductviewCarousalWidget({
    super.key,
    required this.images,
    required this.height,
    required this.width,
    required this.productC,
  });

  final List<String> images;
  final double height;
  final double width;
  final ProductController productC;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index, int realindex) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    images[index],
                  ),
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
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ),
        Positioned(
          top: height * 0.35,
          left: width * 0.40,
          child: AnimatedSmoothIndicator(
            activeIndex: productC.activeCarousal,
            count: images.length,
            effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Color.fromARGB(137, 245, 241, 241),
                dotColor: Color.fromARGB(59, 240, 227, 227)),
          ),
        ),
      ],
    );
  }
}
