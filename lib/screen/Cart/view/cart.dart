import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/controller/cart_controller.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key, required this.height, required this.width});

  final double height;
  final double width;

  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My cart'),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => ListView.builder(
            itemCount: cartC.cartList!.products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https://imgeng.jagran.com/images/2022/nov/Best%20Cameras%20For%20Photography1669186135779.jpg',
                        scale: 9,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartC.cartList!.products[index].product.name),
                            Text('rating'),
                            Text('price & offer price & discound'),
                            Text('Delivery in 3 days')
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.close))
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: height * 0.1,
          width: double.infinity,
          color: const Color.fromARGB(255, 233, 227, 227),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('total'),
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
                  'Check Out',
                  style: TextStyle(
                    fontSize: 17,
                    color: kwhitecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
