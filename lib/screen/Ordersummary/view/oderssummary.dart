import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Account/Controller/account_controller.dart';
import 'package:pixel_gear/screen/Ordersummary/widgets/productdetails.dart';
import 'package:pixel_gear/screen/Payment/controller/paymentController.dart';

import '../../Address/controller/address_controller.dart';
import '../../Cart/controller/cart_controller.dart';
import '../../Cart/model/getcartmodel.dart';
import '../controller/ordersummaryControll.dart';

class OrderSummery extends StatefulWidget {
  const OrderSummery({super.key, required this.page});
  final int page;

  @override
  State<OrderSummery> createState() => _OrderSummeryState();
}

class _OrderSummeryState extends State<OrderSummery> {
  PaymentController paymentController = PaymentController();

  @override
  @override
  void dispose() {
    paymentController.razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartcontrol = Get.put(CartController());
    final address = Get.put(AcountController());
    final orderCOntrollerSummery = Get.put(OrderCOntrollerSummery());

    return GetBuilder<AccountController>(
      builder: (controller) {
        return address.isLoading == true
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
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: kblackcolor,
                    ),
                  ),
                  title: const Text(
                    'Order Summary',
                    style: TextStyle(color: kblackcolor, fontSize: 20),
                  ),
                ),
                body: Stack(
                  children: [
                    Body(cartcontrol: cartcontrol, page: widget.page),
                    Positioned(
                      bottom: Get.height * 0,
                      child: Container(
                        width: Get.width,
                        color: Colors.blueGrey[50],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  widget.page == 1
                                      ? '₹${address.model.price}'
                                      : '₹${(cartcontrol.cartList!.totalPrice - cartcontrol.cartList!.totalDiscount).roundToDouble()}',
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      // side: BorderSide(color: Colors.red)
                                    )),
                                    minimumSize: MaterialStateProperty.all(Size(
                                        Get.width * 0.4, Get.height * 0.05)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.grey.shade900),
                                  ),
                                  onPressed: () {
                                    List<ProductElement> model = [
                                      cartcontrol.reversedProcuct[0]
                                    ];

                                    widget.page == 1
                                        ? PaymentController().setTotalAmount(
                                            int.parse(cartcontrol
                                                .reversedProcuct[0].price
                                                .toString()),
                                            model,
                                            address
                                                .addressList[
                                                    orderCOntrollerSummery
                                                        .index]
                                                .id,
                                            widget.page)
                                        : paymentController.setTotalAmount(
                                            cartcontrol.cartList!.totalPrice,
                                            cartcontrol.cartList!.products,
                                            address
                                                .addressList[
                                                    orderCOntrollerSummery
                                                        .index]
                                                .id,
                                            widget.page);
                                  },
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: kwhitecolor, fontSize: 18),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
