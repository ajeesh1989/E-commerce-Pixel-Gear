import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Ordersummary/widgets/summary.dart';

import '../../Address/controller/address_controller.dart';
import '../../Cart/controller/cart_controller.dart';
import 'header.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.cartcontrol, required this.page})
      : super(key: key);
  final int page;

  final CartController cartcontrol;

  @override
  Widget build(BuildContext context) {
    final adrres = Get.put(AcountController());
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          BeforeBottom(cartcontrol: cartcontrol),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: page == 1 ? 1 : cartcontrol.cartList!.products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: ProductDeatails(index: index, page: page),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight10,
                const Text(
                  'Price Details',
                  style: TextStyle(fontSize: 22),
                ),
                kheight10,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Price',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Text(
                        page == 1
                            ? '₹${adrres.model.price}'
                            : '₹${cartcontrol.cartList!.totalPrice}',
                        style: const TextStyle(
                            color: kblackcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ]),
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Delivery Charge',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Free Delivery',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    )
                  ],
                ),
                kheight10,
                Divider(
                  color: Colors.grey.shade200,
                  height: 1.5,
                  thickness: 1,
                ),
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                        page == 1
                            ? '₹${adrres.model.price}'
                            : '₹${cartcontrol.cartList!.totalPrice}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500))
                  ],
                ),
                const SizedBox(
                  height: 65,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
