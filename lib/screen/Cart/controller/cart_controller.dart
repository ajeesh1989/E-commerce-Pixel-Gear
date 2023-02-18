import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/Service/cart_service.dart';
import 'package:pixel_gear/screen/Cart/model/addcartmodel.dart';
import 'package:pixel_gear/screen/Cart/model/getcartmodel.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    getCart();
    super.onInit();
  }

  bool isLoading = false;
  GetCartModel? cartList;
  List<String> cartItemsId = [];
  int quantity = 1;
  int totalproductCount = 1;
  int? totalSave;
  CartService service = CartService();

  void getCart() async {
    isLoading = true;
    update();
    await service.getCart().then((value) {
      if (value != null) {
        cartList = value;
        update();
        cartItemsId = cartList!.products.map((e) => e.product.id).toList();
        totalSave = (cartList!.totalPrice - cartList!.totalDiscount).toInt();
        totalProductCount();
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
      return null;
    });
  }

  void addToCart(String productId, String size) async {
    log('here');
    isLoading = true;
    update();
    final AddCartModel model = AddCartModel(
      size: size.toString(),
      quantity: quantity,
      productId: productId,
    );
    await service.addToCart(model).then((value) {
      if (value != null) {
        getCart();
        if (value == "product added to cart successfully") {
          Get.snackbar(
            "Added",
            "Product Added To Cart Successfully",
            colorText: Colors.green,
            icon: const Icon(
              Icons.add_alert_rounded,
              color: kblackcolor,
            ),
          );
        }
      } else {
        null;
      }
    });
  }

  void removeCart(productId) {
    log('get in to remove controller');
    service.removeFromCart(productId).then(
      (value) {
        if (value != null) {
          getCart();
          log(totalSave.toString());
          Get.back();
          Get.snackbar(
            "Remove",
            "Product removed from cart successfully",
            colorText: redcolor,
            icon: const Icon(
              Icons.remove_circle,
              color: kblackcolor,
            ),
          );
          update();
        } else {
          return;
        }
      },
    );
  }

  void totalProductCount() {
    int count = 0;
    for (var i = 0; i < cartList!.products.length; i++) {
      count = count + cartList!.products[i].qty;
    }
    totalproductCount = count;
    update();
  }

  Future<void> incrementDecrementQty(
      int qty, String productId, int productQuantity, String size) async {
    final AddCartModel model = AddCartModel(
      size: size.toString(),
      quantity: quantity,
      productId: productId,
    );
    if (qty == 1 && productQuantity >= 1) {
      await CartService().addToCart(model).then(
        (value) async {
          if (value != null) {
            await CartService().getCart().then(
              (value) {
                if (value != null) {
                  cartList = value;
                  update();
                  totalProductCount();
                  cartItemsId =
                      cartList!.products.map((e) => e.product.id).toList();
                  update();
                  totalSave = cartList!.totalDiscount.toInt() -
                      cartList!.totalPrice.toInt();
                  update();
                } else {
                  null;
                }
              },
            );
          } else {
            null;
          }
        },
      );
    }
  }
}
