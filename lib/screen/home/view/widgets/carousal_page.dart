import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';

class CarousalWidget extends StatelessWidget {
  CarousalWidget({
    super.key,
    required this.height,
    required this.homeconntroller,
    required this.width,
  });

  final double height;
  final HomeController homeconntroller;
  final double width;

  final apibaseUrl = ApiBaseUrl();

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
          return Stack(
            children: [
              Container(
                width: width,
                height: height * 0.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kblackcolor,
                  image: DecorationImage(
                    image: NetworkImage(
                        "${apibaseUrl.baseUrl}/carousals/${homeconntroller.carousalList[index].image}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Text(
              //   homeconntroller.carousalList[index].offer,
              //   style: const TextStyle(fontSize: 30, color: kwhitecolor),
              // )
            ],
          );
        },
        itemCount: homeconntroller.carousalList.length);
  }
}
