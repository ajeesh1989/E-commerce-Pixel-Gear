import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pixel_gear/core/colors.dart';

import '../../Home/model/productmodel.dart';
import '../controller/productController.dart';

class ProductviewRating extends StatelessWidget {
  const ProductviewRating(
      {super.key, required this.producm, required this.productc});

  final ProductModel producm;
  final ProductController productc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: producm.rating,
            style: const TextStyle(color: kblackcolor),
            children: [
              WidgetSpan(
                child: RatingBar.builder(
                  initialRating: double.parse(producm.rating),
                  itemSize: 15,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (startRating) {
                    log(startRating.toString());
                  },
                ),
              ),
            ],
          ),
        ),
        const Text(
          'In stock',
          style: TextStyle(color: Colors.green),
        )
      ],
    );
  }
}
