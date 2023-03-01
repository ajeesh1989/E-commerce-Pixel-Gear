import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Order_place/model/all_order_model.dart';
import 'package:pixel_gear/screen/orderDetails/controller/orderDetailsController.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Order_place/controller/all_order_placeController.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.model, required this.index});
  final AllOrder model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final orderC = Get.put(AllOrderController());
    final ordeCanceController = Get.put(OrderDetailsController());
    log(model.orderStatus);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: kblackcolor,
          ),
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(
              color: kblackcolor, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: Get.width,
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Text(
                      'Order ID - ${model.id}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(thickness: 2, height: 0),
            Container(
              color: kwhitecolor,
              height: 150,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.products[0].product.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          kheight10,
                          Text(
                            'quantity ${model.products[0].qty}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          kheight10,
                          Text(
                            '₹ ${model.products[0].product.price}',
                            style: const TextStyle(
                                fontSize: 22,
                                color: kblackcolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                '${ApiBaseUrl().baseUrl}/products/${model.products[0].product.image[0]}'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(thickness: 2, height: 0),
            GetBuilder<AllOrderController>(
              builder: (controller) {
                log(orderC.orderList[index].cancelDate.toString());
                log(orderC.orderList[index].orderStatus);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 20),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.green,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Order confirmed\n",
                              style: const TextStyle(
                                  fontSize: 18, color: kblackcolor),
                              children: [
                                TextSpan(
                                    text:
                                        '${model.orderDate.day}/${model.orderDate.month}/${model.orderDate.year}',
                                    style: const TextStyle(fontSize: 17))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 20),
                          child: orderC.orderList[index].orderStatus ==
                                  'CANCELED'
                              ? Row(
                                  children: [
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const CircleAvatar(
                                      radius: 10,
                                      backgroundColor: redcolor,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "Order Cancelled\n",
                                        style: const TextStyle(
                                            fontSize: 18, color: kblackcolor),
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${orderC.orderList[index].cancelDate.toString().substring(8, 10)}/${orderC.orderList[index].cancelDate.toString().substring(6, 7)}/${orderC.orderList[index].cancelDate.toString().substring(0, 4)}',
                                              style:
                                                  const TextStyle(fontSize: 17))
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: const [
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Colors.grey,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Order Shipped',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                  ],
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        orderC.orderList[index].orderStatus == 'CANCELED'
                            ? const Text('')
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 20),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.radio_button_off,
                                          color: Colors.grey,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'Order Delivered',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  kheight40,
                                ],
                              ),
                      ],
                    ),
                    Container(
                      width: Get.width,
                      height: 70,
                      color: Colors.grey.shade300,
                      child: orderC.orderList[index].orderStatus == 'CANCELED'
                          ? Center(
                              child: GestureDetector(
                                onTap: () => launchUr(Uri.parse(
                                    'mailto:akhilb4001@gmail.com?subject=Help me&body=need help')),
                                child: const Text(
                                  'Need help?',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.defaultDialog(
                                        onConfirm: () {
                                          ordeCanceController
                                              .cancelOrder(model.id);
                                          Get.back();
                                        },
                                        textConfirm: 'Yes',
                                        title: 'Cancel',
                                        textCancel: 'No',
                                        middleText: 'Do you want to cancel');
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                      'https://play.google.com/store/apps/details?id=com.',
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(Icons.share),
                                      const SizedBox(
                                        width: 9,
                                      ),
                                      Text('Share Order Details',
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.grey.shade700))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    )
                  ],
                );
              },
            ),
            Container(
              width: Get.width,
              height: 45,
              color: Colors.grey.shade200,
              child: const Padding(
                padding: EdgeInsets.only(left: 14.0, top: 13),
                child: Text('Shopping Details'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15),
              child: RichText(
                text: TextSpan(
                  text: "${model.fullName}\n",
                  style: const TextStyle(fontSize: 18, color: kblackcolor),
                  children: [
                    TextSpan(
                        text: '${model.place}\n',
                        style: const TextStyle(fontSize: 17)),
                    TextSpan(
                        text: '${model.landMark}\n',
                        style: const TextStyle(fontSize: 17)),
                    TextSpan(
                        text: '${model.state}:-${model.pin}',
                        style: const TextStyle(fontSize: 17)),
                    TextSpan(
                        text: '\nPhone Number:-${model.phone}',
                        style: const TextStyle(fontSize: 17))
                  ],
                ),
              ),
            ),
            kheight30,
          ],
        ),
      ),
    );
  }

  Future<void> launchUr(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch ';
    }
  }
}
