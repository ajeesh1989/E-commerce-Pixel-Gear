import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/util/shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              kwidth10,
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const ShimmerWidget.circle(height: 60, width: 60),
                  ),
                  kheight10,
                  const ShimmerWidget.rectangle(height: 20, width: 60)
                ],
              ),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return kwidth10;
        },
      ),
    );
  }
}
