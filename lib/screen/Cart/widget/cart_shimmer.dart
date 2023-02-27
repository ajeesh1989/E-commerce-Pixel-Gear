import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/controller/cart_controller.dart';
import 'package:pixel_gear/util/shimmer/shimmer.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return ListView.separated(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                kwidth10,
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 25),
                  child: Column(
                    children: [
                      const ShimmerWidget.rectangle(height: 100, width: 100),
                      kheight20,
                      Row(
                        children: [
                          const ShimmerWidget.circle(height: 20, width: 20),
                          kwidth10,
                          ShimmerWidget.rectangle(
                            height: 20,
                            width: 40,
                            radius: BorderRadius.circular(10),
                          ),
                          kwidth10,
                          const ShimmerWidget.circle(height: 20, width: 20),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ShimmerWidget.rectangle(height: 10, width: 140),
                      kheight20,
                      ShimmerWidget.rectangle(height: 10, width: 110),
                      kheight20,
                      ShimmerWidget.rectangle(height: 10, width: 50),
                      kheight20,
                      ShimmerWidget.rectangle(height: 10, width: 70),
                      kheight20,
                      ShimmerWidget.rectangle(height: 10, width: 100),
                      kheight20,
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShimmerWidget.rectangle(height: 40, width: Get.width * 0.4),
                  ShimmerWidget.rectangle(height: 40, width: Get.width * 0.4),
                ],
              ),
            ),
          ],
        );
      },
      itemCount: cartController.cartList?.products.length ?? 10,
      separatorBuilder: (context, index) => kheight05,
    );
  }
}
