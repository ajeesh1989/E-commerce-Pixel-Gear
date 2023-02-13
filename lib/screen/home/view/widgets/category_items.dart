import 'package:flutter/material.dart';
import 'package:pixel_gear/util/Box/box.dart';

import '../../../../core/colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.height,
    required this.categoryList,
    required this.categorynames,
  });

  final double height;
  final List<String> categoryList;
  final List<String> categorynames;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height * 0.17,
      child: Box(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            categoryList.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: kwhitecolor,
                      backgroundImage: NetworkImage(categoryList[index]),
                    ),
                    kheight10,
                    Text(categorynames[index])
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
