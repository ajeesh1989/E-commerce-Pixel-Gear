import 'package:flutter/material.dart';
import 'package:pixel_gear/core/colors.dart';

class ProductviewBottomNavwidget extends StatelessWidget {
  const ProductviewBottomNavwidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: double.infinity,
      color: const Color.fromARGB(255, 233, 227, 227),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.4, height * 0.08),
              maximumSize: Size.fromHeight(height * 0.1),
              backgroundColor: Colors.grey.shade700,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: kwhitecolor,
            ),
            label: const Text(
              'Add Cart',
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
                minimumSize: Size(width * 0.4, height * 0.08),
                backgroundColor: Colors.grey.shade700,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {},
            child: const Text(
              'Buy now',
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
