import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';
import 'package:pixel_gear/screen/Cart/controller/cart_controller.dart';
import 'package:pixel_gear/screen/Ordersummary/view/oderssummary.dart';

class CartBottom extends StatelessWidget {
  CartBottom({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: double.infinity,
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Total ', style: TextStyle(fontSize: 18)),
                TextSpan(
                  text: cartC.totalSave.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          // Text(
          //   "Total ${cartC.totalSave}",
          //   style: TextStyle(
          //       color: kblackcolor, fontSize: 18, fontWeight: FontWeight.w500),
          // ),
          SizedBox(
            width: width * 0.1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.30, height * 0.06),
              backgroundColor: Colors.grey.shade800,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Get.to(() => OrderSummery(
                    page: 0,
                  ));
            },
            child: const Text(
              'Check Out',
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
