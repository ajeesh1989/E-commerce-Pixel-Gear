import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/view/cart.dart';
import 'package:pixel_gear/screen/Order_place/model/all_order_model.dart';
import 'package:pixel_gear/screen/orderDetails/view/orderDetails.dart';

import '../../../api/api_baseurl.dart';
import '../controller/all_order_placeController.dart';

class OrderPlace extends StatelessWidget {
  const OrderPlace({super.key, required this.height, required this.width});

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final orderC = Get.put(AllOrderController());
    orderC.getorder();
    return GetBuilder<AllOrderController>(builder: (controller) {
      log(orderC.orderList.length.toString());
      return orderC.isLoding == true
          ? const Center(
              child: CircularProgressIndicator(
                color: kwhitecolor,
                backgroundColor: Colors.cyan,
              ),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: kwhitecolor,
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: kblackcolor,
                  ),
                ),
                title: const Text(
                  "My Orders",
                  style: TextStyle(
                      color: kblackcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                actions: [
                  IconButton(
                      onPressed: () => Get.to(
                            MyCart(
                              height: height,
                              width: width,
                            ),
                          ),
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: kblackcolor,
                      )),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                ],
                centerTitle: true,
              ),
              body: ListView.builder(
                itemCount: orderC.orderList.length,
                itemBuilder: (context, index) {
                  log('order');
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          final model = AllOrder(
                              address: orderC.orderList[index].address,
                              deliveryDate:
                                  orderC.orderList[index].deliveryDate,
                              fullName: orderC.orderList[index].fullName,
                              id: orderC.orderList[index].id,
                              landMark: orderC.orderList[index].landMark,
                              orderDate: orderC.orderList[index].orderDate,
                              orderStatus: orderC.orderList[index].orderStatus,
                              paymentStatus:
                                  orderC.orderList[index].paymentStatus,
                              paymentType: orderC.orderList[index].paymentType,
                              phone: orderC.orderList[index].phone,
                              pin: orderC.orderList[index].pin,
                              place: orderC.orderList[index].place,
                              products: orderC.orderList[index].products,
                              state: orderC.orderList[index].state,
                              totalDiscount:
                                  orderC.orderList[index].totalDiscount,
                              totalPrice: orderC.orderList[index].totalPrice,
                              userid: orderC.orderList[index].userid,
                              v: orderC.orderList[index].v,
                              cancelDate: orderC.orderList[index].cancelDate);
                          Get.to(
                            OrderDetails(
                              model: model,
                              index: index,
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${ApiBaseUrl().baseUrl}/products/${orderC.orderList[index].products[0].product.image[0]}'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 17.0, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orderC.orderList[index].products[0].product
                                        .name,
                                    style: const TextStyle(
                                        color: kblackcolor, fontSize: 20),
                                  ),
                                  kheight10,
                                  orderC.orderList[index].orderStatus ==
                                          'CANCELED'
                                      ? Text(
                                          'Cancel date ${orderC.orderList[index].cancelDate.toString().substring(8, 10)}/${orderC.orderList[index].cancelDate.toString().substring(6, 7)}/${orderC.orderList[index].cancelDate.toString().substring(0, 4)}',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        )
                                      : Text(
                                          'Delivery date ${orderC.orderList[index].deliveryDate.day}/${orderC.orderList[index].deliveryDate.month}/${orderC.orderList[index].deliveryDate.year}',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 25,
                        color: Colors.grey,
                      )
                    ],
                  );
                },
              ),
            );
    });
  }
}
