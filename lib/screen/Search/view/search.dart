import 'package:flutter/material.dart';

import 'package:pixel_gear/core/colors.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Category',
          style: TextStyle(color: kblackcolor),
        ),
      ),
    );
  }
}
