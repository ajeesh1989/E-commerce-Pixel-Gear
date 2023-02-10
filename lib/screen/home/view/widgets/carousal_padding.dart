import 'package:flutter/material.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'carousal_page.dart';

class CarousalPadding extends StatelessWidget {
  const CarousalPadding({
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: CarousalWidget(
                height: height,
                homeconntroller: homeconntroller,
                width: width,
                images: images),
          ),
          Positioned(
            top: height * 0.218,
            left: width * 0.4,
            child: AnimatedSmoothIndicator(
                effect: const WormEffect(
                    dotWidth: 11,
                    dotHeight: 11,
                    radius: 16,
                    activeDotColor: Colors.white54,
                    dotColor: Colors.white24),
                activeIndex: homeconntroller.activeIndex,
                count: images.length),
          ),
        ],
      ),
    );
  }
}
