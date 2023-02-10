import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';

class CarousalWidget extends StatelessWidget {
  const CarousalWidget({
    super.key,
    required this.height,
    required this.homeconntroller,
    required this.width,
    required this.images,
  });

  final double height;
  final HomeController homeconntroller;
  final double width;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: height * 0.25,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {
            homeconntroller.smoothIndicator(index);
          },
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            width: width,
            height: height * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kblackcolor,
              image: DecorationImage(
                image: NetworkImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: images.length);
  }
}
