import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/BottomNavBar/View/bottomnav.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Order_place/model/all_order_model.dart';
import 'package:pixel_gear/screen/orderDetails/controller/orderDetailsController.dart';
import 'package:pixel_gear/screen/product/view/product.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Order_place/controller/all_order_placeController.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails(
      {super.key,
      required this.model,
      required this.index,
      required this.height,
      required this.width});
  final AllOrder model;
  final int index;
  final productC = Get.put(
    HomeController(),
  );
  final double height;
  final double width;

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
            Icons.arrow_back,
            color: kblackcolor,
          ),
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(
              color: kblackcolor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                BottomNavPage(),
              );
            },
            icon: const Icon(
              Icons.home,
              color: kblackcolor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: SizedBox(
                height: 30,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Order ID - ${model.id}',
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                height: 150,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${ApiBaseUrl().baseUrl}/products/${model.products[0].product.image[0]}'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kheight10,
                            Text(
                              model.products[0].product.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            kheight10,
                            Text(
                              'Quantity - ${model.products[0].qty}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            kheight10,
                            Text(
                              '₹${model.products[0].product.price - model.products[0].product.discountPrice}',
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: kblackcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 1,
              child: SizedBox(
                width: Get.width,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          ProductScreen(
                            height: height,
                            width: width,
                            productid: model.products[0].product.id,
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Buy Again',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                                  fontSize: 17, color: kblackcolor),
                              children: [
                                TextSpan(
                                  text:
                                      '${model.orderDate.day}/${model.orderDate.month}/${model.orderDate.year}',
                                  style: const TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    kheight20,
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 18),
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
                                            fontSize: 17, color: kblackcolor),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${orderC.orderList[index].cancelDate.toString().substring(8, 10)}/${orderC.orderList[index].cancelDate.toString().substring(6, 7)}/${orderC.orderList[index].cancelDate.toString().substring(0, 4)}',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          )
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
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Order Shipped',
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 17),
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
                                        top: 15, left: 17),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.radio_button_off,
                                          color: Colors.grey,
                                          size: 25,
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
                                  kheight20
                                ],
                              ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Card(
                      elevation: 1,
                      child: SizedBox(
                        width: Get.width,
                        height: 40,
                        child: orderC.orderList[index].orderStatus == 'CANCELED'
                            ? Center(
                                child: GestureDetector(
                                  onTap: () => launchUr(
                                    Uri.parse(
                                        'mailto:ajeeshrko@gmail.com?subject=Help me&body=need help'),
                                  ),
                                  child: const Text(
                                    'Need help?',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          cancelTextColor: kblackcolor,
                                          confirmTextColor: kwhitecolor,
                                          middleText: 'want to cancel?',
                                          buttonColor: Colors.grey.shade900);
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black87),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Share.share(
                                        'https://play.google.com/store/apps/details?id=com.',
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.share),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Text('Share Order Details',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black87))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Card(
              elevation: 1,
              child: SizedBox(
                width: Get.width,
                height: 45,
                child: const Padding(
                  padding: EdgeInsets.only(left: 14.0, top: 13),
                  child: Text(
                    'Shopping Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15),
              child: RichText(
                text: TextSpan(
                  text: "${model.fullName}\n",
                  style: const TextStyle(fontSize: 17, color: kblackcolor),
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
