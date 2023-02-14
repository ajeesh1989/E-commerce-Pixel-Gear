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
  });

  final double height;
  final HomeController homeconntroller;
  final double width;

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
            ),
          ),
          Positioned(
            top: height * 0.218,
            left: width * 0.32,
            child: AnimatedSmoothIndicator(
                effect: const WormEffect(
                    dotWidth: 12,
                    dotHeight: 12,
                    radius: 16,
                    activeDotColor: Color.fromARGB(137, 245, 241, 241),
                    dotColor: Color.fromARGB(59, 240, 227, 227)),
                activeIndex: homeconntroller.activeIndex,
                count: homeconntroller.carousalList.length),
          ),
        ],
      ),
    );
  }
}
