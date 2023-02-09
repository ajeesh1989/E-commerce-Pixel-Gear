import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .25,
        backgroundColor: kwhitecolor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: kblackcolor,
          ),
        ),
        title: Text(
          'P I X E L  G E A R',
          style: GoogleFonts.openSans(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w100),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kblackcolor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: kblackcolor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 200.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Text(
                      'text $i',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          kheight05,
          // CarouselSlider.builder(
          //   options: CarouselOptions(
          //     height: height * 0.2,
          //     aspectRatio: 16 / 9,
          //     viewportFraction: 1,
          //     initialPage: 0,
          //     enableInfiniteScroll: true,
          //     reverse: false,
          //     autoPlay: true,
          //     autoPlayInterval: const Duration(seconds: 5),
          //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enlargeCenterPage: true,
          //     enlargeFactor: 0.3,
          //     onPageChanged: (index, reason) {
          //       controller.smoothIndicator(index);
          //     },
          //     scrollDirection: Axis.horizontal,
          //   ),
          //   itemBuilder: (BuildContext context, int index, int realIndex) {
          //     return Container(
          //       width: kwidth,
          //       height: height * 0.28,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         color: kwhitecolor,
          //         image: DecorationImage(
          //           image: NetworkImage(
          //               '${ApiBaseUrl.baseUrl}/carousals/${controller.carousalList[index].image}'),
          //           // fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          //   itemCount: controller.carousalList.length,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
