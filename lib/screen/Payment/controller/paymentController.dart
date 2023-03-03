import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Order_place/view/order_place.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../Cart/controller/cart_controller.dart';
import '../../Cart/model/getcartmodel.dart';
import '../../Ordersummary/model/order_model.dart';
import '../../Ordersummary/service/orderService.dart';

class PaymentController extends GetxController {
  Razorpay razorpay = Razorpay();
  List<Product> products = [];
  String? addressId;
  Map<String, dynamic> options = {};
  final cartcotro = Get.put(CartController());

  void setTotalAmount(
      int amount, List<ProductElement> productsList, address, int page) {
    log('setTotal');
    final total = "${amount * 100}";
    final amountPayable = total.toString();
    update();
    products = productsList.map((e) => Product(id: e.id)).toList();
    update();

    log(amountPayable);
    openCheckout(amountPayable);

    log(products.length.toString());
    log(products[0].id.toString());
    addressId = address;
    update();
    log(addressId.toString());
    update();
  }

  openCheckout(amountPayable) async {
    options = {
      'key': 'rzp_test_K1qY31Ub3PKsMs',
      'amount': amountPayable,
      'name': 'Scotch',
      'description': 'Laptop',
      'prefill': {'contact': '9895709034', 'email': 'Scotch@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        handlePaymentSuccess(response);
        orderProducts(addressId!, 'ONLINE_PAYMENT');
        update();
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
        handlePaymentError(response);
      });
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
        handleExternalWallet(response);
      });
    } on PaymentFailureResponse catch (e) {
      log(e.error.toString());
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar(
      'payment',
      "SUCCESS:${response.paymentId}",
      colorText: kwhitecolor,
      backgroundColor: Colors.black54,
    );

    update();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar(
      'payment',
      "ERROR:${response.code} - ${response.message}",
      colorText: kwhitecolor,
      backgroundColor: Colors.black54,
    );

    update();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar(
      'payment',
      "EXTERNAL_WALLET:${response.walletName}",
      colorText: kwhitecolor,
      backgroundColor: Colors.black54,
    );

    update();
  }

  bool loading = false;
  Future<void> orderProducts(String addressId, paymentType) async {
    log(addressId);
    log(paymentType);
    log(products[0].id);

    loading = true;
    update();
    final OrdersModel model = OrdersModel(
        addressId: addressId, paymentType: paymentType, products: products);
    log(addressId);
    log(paymentType);
    log(products[0].id);

    await OrderService().placeOrder(model).then(
      (value) {
        if (value != null) {
          loading = false;
          update();

          Get.off(OrderPlace(
            height: Get.height,
            width: Get.width,
          ));
          cartcotro.getCart();
          Get.snackbar(
            'Order Placed',
            'Order placed succefully',
            backgroundColor: Colors.black87,
            colorText: kwhitecolor,
          );
        } else {
          loading = false;
          update();
        }
      },
    );
  }
}
