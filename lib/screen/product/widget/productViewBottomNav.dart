import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/controller/cart_controller.dart';
import 'package:pixel_gear/screen/Cart/view/cart.dart';

class ProductviewBottomNavwidget extends StatelessWidget {
  const ProductviewBottomNavwidget({
    super.key,
    required this.height,
    required this.width,
    required this.size,
    required this.id,
  });

  final double height;
  final double width;
  final String size;
  final String id;

  @override
  Widget build(BuildContext context) {
    final cartC = Get.put(CartController());

    return Container(
      height: height * 0.1,
      width: double.infinity,
      color: const Color.fromARGB(255, 233, 227, 227),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.35, height * 0.08),
              maximumSize: Size.fromHeight(height * 0.1),
              backgroundColor: Colors.grey.shade800,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {
              cartC.addToCart(id, size);
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: kwhitecolor,
            ),
            label: const Text(
              'Add to Cart',
              style: TextStyle(
                color: kwhitecolor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.1,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.35, height * 0.08),
              backgroundColor: Colors.grey.shade800,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Buy Now',
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
