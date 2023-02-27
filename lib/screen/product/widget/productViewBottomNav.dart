import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/controller/cart_controller.dart';
import 'package:pixel_gear/screen/Cart/view/cart.dart';
import 'package:pixel_gear/screen/Home/model/productmodel.dart';

class ProductviewBottomNavwidget extends StatelessWidget {
  ProductviewBottomNavwidget(
      {super.key,
      required this.height,
      required this.width,
      required this.size,
      required this.id,
      required this.productmodel});

  final double height;
  final double width;
  final String size;
  final String id;
  final apibaseUrl = ApiBaseUrl();
  final ProductModel productmodel;

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
              minimumSize: Size(width * 0.35, height * 0.06),
              maximumSize: Size.fromHeight(height * 0.1),
              backgroundColor: Colors.grey.shade800,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {
              cartC.addToCart(id, size);
              Get.bottomSheet(
                Container(
                  height: 500,
                  color: const Color.fromARGB(255, 225, 231, 234),
                  child: Column(
                    children: [
                      kheight05,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                          kwidth10,
                          Text(
                            'Hooray! Your item added to the cart',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        productmodel.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      kheight10,
                      Container(
                        height: Get.height * 0.475,
                        color: kwhitecolor,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${apibaseUrl.baseUrl}/products/${productmodel.image[0]}'),
                                ),
                              ),
                              height: height * 0.23,
                              width: width * 0.95,
                            ),
                            kheight05,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Text(
                                '${productmodel.description}.',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            kheight10,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Positioned(
                                child: Row(
                                  children: [
                                    const Text(
                                      "M.R.P:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                    kwidth10,
                                    Text(
                                      '${productmodel.price}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: greycolor),
                                    ),
                                    kwidth10,
                                    Text(
                                      '₹${productmodel.price - productmodel.discountPrice}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    Text(
                                      ' (offer ${productmodel.offer}%)',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            kheight10,
                            Container(
                              color: const Color.fromARGB(255, 225, 231, 234),
                              width: Get.width,
                              height: Get.height * 0.05,
                              child: TextButton(
                                  onPressed: () {
                                    Get.off(
                                      () => MyCart(
                                        height: height,
                                        width: width,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Go to Cart',
                                    style: TextStyle(color: kblackcolor),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                barrierColor: Colors.grey.shade100,
                isDismissible: true,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(35),
                //     side: BorderSide(width: 5, color: Colors.black)),
                enableDrag: false,
              );
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
              minimumSize: Size(width * 0.35, height * 0.06),
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
