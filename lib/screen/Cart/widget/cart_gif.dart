import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';

class CartGif extends StatelessWidget {
  const CartGif({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'lib/images/cartempty.jpg',
            scale: 2,
          ),
          const Text(
            'Your cart is empty!',
            style: TextStyle(fontSize: 20, color: kblackcolor),
          ),
          kheight10,
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(
              'Looks like you have not added anything to your cart. Go ahead and explore top cameras',
              style: TextStyle(fontSize: 16, color: greycolor),
            ),
          ),
          kheight20,
          GestureDetector(
            onTap: () {
              Get.to(
                BottomNavPage(),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 225, 231, 234),
              ),
              height: height * 0.035,
              width: width * 0.4,
              child: const Center(
                  child: Text(
                'Back to pixel gear',
                style: TextStyle(fontSize: 17),
              )),
            ),
          )
        ],
      ),
    );
  }
}
