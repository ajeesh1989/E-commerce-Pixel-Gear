import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';

import '../../../api/api_baseurl.dart';
import '../../Address/controller/address_controller.dart';
import '../../Cart/controller/cart_controller.dart';

class ProductDeatails extends StatelessWidget {
  const ProductDeatails({Key? key, required this.index, required this.page})
      : super(key: key);
  final int index;
  final int page;

  @override
  Widget build(BuildContext context) {
    final cartcontrol = Get.put(CartController());
    final adrres = Get.put(AcountController());
    return Card(
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            page == 1
                ? '${ApiBaseUrl().baseUrl}/products/${adrres.model.image[0]}'
                : '${ApiBaseUrl().baseUrl}/products/${cartcontrol.cartList!.products[index].product.image[0]}',
            height: 150,
            width: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(left: Get.size.width * 0.440),
                //   child: IconButton(
                //       onPressed: () {
                //         Get.defaultDialog(
                //             title: 'Remove Item',
                //             middleText: 'Are you sure want to remove this item?',
                //             onConfirm: () {
                //               cartcontrol.removeCart(cartcontrol
                //                   .cartList!.products[index].product.id);
                //               Get.back();
                //             },
                //             textConfirm: 'Yes',
                //             textCancel: 'No');
                //       },
                //       icon: const Icon(Icons.dangerous)),
                // ),
                Text(
                  page == 1
                      ? adrres.model.name
                      : cartcontrol.cartList!.products[index].product.name,
                  style: const TextStyle(
                    fontSize: 21,
                  ),
                  maxLines: 2,
                ),
                kheight10,
                RatingBar.builder(
                  initialRating: double.parse(page == 1
                      ? adrres.model.rating
                      : cartcontrol.cartList!.products[index].product.rating),
                  itemSize: 15,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (startRating) {},
                ),
                kheight10,
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: page == 1
                            ? '₹${adrres.model.offer}'
                            : '₹${cartcontrol.cartList!.products[index].product.offer}',
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color.fromARGB(255, 112, 114, 115),
                            fontSize: 15)),
                    TextSpan(
                        text: page == 1
                            ? '₹${adrres.model.price}'
                            : ' ₹${cartcontrol.cartList!.products[index].product.price}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20)),
                    TextSpan(
                        text: page == 1
                            ? ' ${adrres.model.discountPrice}% off'
                            : ' ${cartcontrol.cartList!.products[index].product.discountPrice}% off',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        ))
                  ]),
                ),
                kheight10,
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: ' Delivery in 4 days |',
                      style: TextStyle(
                          color: Color.fromARGB(
                            255,
                            112,
                            114,
                            115,
                          ),
                          fontSize: 12)),
                  TextSpan(
                      text: ' Free delivery',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                      )),
                ])),
              ],
            ),
          )
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Card(
                elevation: 3,
                child: Row(
                  children: [
                    GetBuilder<CartController>(
                      builder: (controller) {
                        return SizedBox(
                            width: 44,
                            height: 24,
                            child: Center(
                              child: Text(
                                page == 1
                                    ? '1'
                                    : cartcontrol.cartList!.products[index].qty
                                        .toString(),
                                style: const TextStyle(fontSize: 17),
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        kheight10,
      ]),
    );
  }
}
