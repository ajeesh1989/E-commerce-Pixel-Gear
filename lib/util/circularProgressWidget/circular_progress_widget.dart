import 'package:flutter/material.dart';
import 'package:pixel_gear/core/colors.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: kblackcolor,
        backgroundColor: kwhitecolor,
      ),
    );
  }
}
