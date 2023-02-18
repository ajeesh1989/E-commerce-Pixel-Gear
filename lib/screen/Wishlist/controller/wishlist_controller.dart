import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Wishlist/model/wishlist_model.dart';
import 'package:pixel_gear/screen/Wishlist/service/wishlist_service.dart';

class WishListController extends GetxController {
  @override
  void onInit() {
    getWishlist();
    super.onInit();
  }

  bool isLoading = false;
  WishlistModel? wishlistmodel;
  List<dynamic> wishList = [];
  WishlistService wishlistService = WishlistService();
  bool wishcheck = false;

  void getWishlist() async {
    isLoading = true;
    update();
    await wishlistService.getWishlist().then(
      (value) {
        if (value != null) {
          wishlistmodel = value;
          update();
          wishList = wishlistmodel!.products.map((e) => e.product.id).toList();
          update();
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
  }

  void addOrRemoveFromWishlist(String productId) async {
    isLoading = true;
    update();
    await wishlistService.addOrRemoveWishlist(productId).then((value) {
      if (value != null) {
        wishlistService.getWishlist().then((value) {
          if (value != null) {
            wishlistmodel = value;
            update();
            getWishlist();
            isLoading = false;
            update();
          } else {
            isLoading = false;
            update();
          }
        });
        if (value == 201) {
          Get.snackbar(
            backgroundColor: Colors.black54,
            "Added",
            "Item added to Wishlist",
            colorText: kwhitecolor,
            icon: const Icon(
              Icons.add_alert_rounded,
              color: kwhitecolor,
            ),
          );
        } else if (value == 204) {
          Get.snackbar(
            backgroundColor: Colors.black54,
            "Removed",
            "Item removed from Wishlist",
            colorText: kwhitecolor,
            icon: const Icon(
              Icons.remove_circle_outline_rounded,
              color: kwhitebutton,
            ),
          );
        }
      } else {
        isLoading = false;
        update();
      }
    });
  }
}
