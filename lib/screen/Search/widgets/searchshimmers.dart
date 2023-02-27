import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/util/shimmer/shimmer.dart';

class NewlyLaunchedShimmer extends StatelessWidget {
  const NewlyLaunchedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 6 / 8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ShimmerWidget.rectangle(
            height: 20,
            width: 20,
            radius: BorderRadius.circular(20),
          );
        },
        itemCount: homeC.searchResult.length,
      ),
    );
  }
}
