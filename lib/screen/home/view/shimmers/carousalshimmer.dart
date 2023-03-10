import 'package:flutter/material.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/util/shimmer/shimmer.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        SizedBox(
          width: double.infinity,
          child: ShimmerWidget.rectangle(height: 150, width: double.infinity),
        ),
        kheight10,
      ],
    );
  }
}
