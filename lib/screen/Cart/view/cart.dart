import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';
import 'package:pixel_gear/screen/Cart/controller/cart_controller.dart';
import 'package:pixel_gear/screen/Cart/widget/cart_bottom.dart';
import 'package:pixel_gear/screen/Cart/widget/cart_gif.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key, required this.height, required this.width});

  final double height;
  final double width;

  final cartC = Get.put(CartController());
  final apibaseUrl = ApiBaseUrl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kwhitecolor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kblackcolor,
            )),
        title: const Text(
          'My cart',
          style: TextStyle(color: kblackcolor),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => controller.cartItemsId.isEmpty
            ? CartGif(height: height, width: width)
            : ListView.builder(
                itemCount: cartC.cartList!.products.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width * 0.4,
                              height: height * 0.18,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${apibaseUrl.baseUrl}/products/${controller.cartList!.products[index].product.image[0]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.cartList!.products[index]
                                          .product.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      controller.cartList!.products[index]
                                          .product.description,
                                      textWidthBasis:
                                          TextWidthBasis.longestLine,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: kblackcolor,
                                      ),
                                    ),
                                    kheight10,
                                    Row(
                                      children: [
                                        Text(
                                          'M.R.P:',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          controller.cartList!.products[index]
                                              .product.price
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          ' ${controller.cartList!.products[index].product.price - controller.cartList!.products[index].product.discountPrice}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                    kheight05,
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "Offer" +
                                          controller.cartList!.products[index]
                                              .product.offer
                                              .toString() +
                                          '% off',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    kheight10,
                                    const Text(
                                      'In stock',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    kheight05,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: height * 0.05,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 238, 237, 237),
                                  border: Border.all(color: greycolor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: const Color.fromARGB(
                                          255, 225, 231, 234),
                                      minimumSize:
                                          Size(width * 0.05, height * 0.05),
                                    ),
                                    onPressed: () {
                                      controller.incrementDecrementQty(
                                        -1,
                                        controller.cartList!.products[index]
                                            .product.id,
                                        controller
                                            .cartList!.products[index].qty,
                                        controller.cartList!.products[index]
                                            .product.size[0]
                                            .toString(),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: kblackcolor,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.13,
                                    // height: height * 0.05,
                                    color: Color.fromARGB(255, 225, 231, 234),

                                    child: Center(
                                        child: Text(
                                      controller.cartList!.products[index].qty
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor:
                                            Color.fromARGB(255, 225, 231, 234),
                                        minimumSize:
                                            Size(width * 0.05, height * 0.05)),
                                    onPressed: () {
                                      controller.incrementDecrementQty(
                                        1,
                                        controller.cartList!.products[index]
                                            .product.id,
                                        controller
                                            .cartList!.products[index].qty,
                                        controller.cartList!.products[index]
                                            .product.size[0]
                                            .toString(),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: kblackcolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            kwidth10,
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: kwhitecolor,
                                minimumSize: Size(width * 0.2, height * 0.05),
                                side: const BorderSide(
                                  width: 1,
                                  color: greycolor,
                                ),
                              ),
                              onPressed: () {
                                controller.removeCart(controller
                                    .cartList!.products[index].product.id);
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: kblackcolor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => controller.cartItemsId.isEmpty
            ? const Text('')
            : CartBottom(height: height, width: width),
      ),
    );
  }
}
