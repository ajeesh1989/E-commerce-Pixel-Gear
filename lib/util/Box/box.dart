import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';

class Box extends GetView {
  // ignore: prefer_typing_uninitialized_variables
  final child;
  const Box({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: kwhitecolor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: kwhitecolor,
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
