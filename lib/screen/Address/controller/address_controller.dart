import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Address/model/edit_addressmodel.dart';
import 'package:pixel_gear/screen/Address/model/get_addressmodel.dart';
import 'package:pixel_gear/screen/Address/service/address_service.dart';
import 'package:pixel_gear/screen/auth/sign_in/view/signin.dart';

import '../../Cart/model/getcartmodel.dart';
import '../../Home/model/productmodel.dart';
import '../../auth/sign_in/controller/signincontroller.dart';

class AcountController extends GetxController {
  @override
  void onInit() {
    getAllAddress();
    super.onInit();
  }

  int change = 0;
  void changeinde(index) {
    change = index;
    update();
  }

  final signup = Get.put(SignInController());

  final addressService = AddressService();

  final TextEditingController tittleC = TextEditingController();
  final TextEditingController fullNameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController pinC = TextEditingController();
  final TextEditingController stateC = TextEditingController();
  final TextEditingController placeC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController landmarkC = TextEditingController();
  late ProductModel model;

  bool isLoading = false;

  List<GetAddressModel> addressList = [];
  late ProductElement prodmodel;

  FlutterSecureStorage storage = const FlutterSecureStorage();
  void productModelForOneProdBuy(modele, prodmodels) {
    model = modele;
    update();
    prodmodel = prodmodels;
    update();

    log(model.name, name: 'productModelForOneProdBuy');
  }

  void addAccount() async {
    isLoading = true;
    update();

    final AddressModel model = AddressModel(
      title: tittleC.text.trim(),
      fullName: fullNameC.text.trim(),
      phone: phoneC.text.trim(),
      pin: pinC.text.trim(),
      state: stateC.text.trim(),
      place: placeC.text.trim(),
      address: addressC.text.trim(),
      landMark: landmarkC.text.trim(),
    );

    await addressService.addAddress(model).then((value) {
      if (value != null) {
        log('add account', name: 'add accoutn');
        getAllAddress();

        Get.back();
        isLoading = false;
        update();

        tittleC.clear();

        fullNameC.clear();

        phoneC.clear();

        pinC.clear();

        stateC.clear();

        placeC.clear();

        addressC.clear();

        landmarkC.clear();
        update();
        Get.snackbar(
          "Added", "Address added successfully",
          backgroundColor: Colors.black87, colorText: kwhitecolor,
          // snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        isLoading = false;
        update();
      }
    });
    return null;
  }

  Future<String?> getAllAddress() async {
    isLoading = true;
    update();
    await AddressService().getAddress().then((value) {
      if (value != null) {
        log(value.toString());
        addressList = value;
        update();
        isLoading = false;
        update();
        return 'Done';
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
    isLoading = false;
    update();
    return null;
  }

  void deleteAddress(String addressId) async {
    log('delete function entered');
    isLoading = true;
    update();
    await AddressService().deleteAddress(addressId).then((value) {
      if (value != null) {
        getAllAddress();
        // Get.back();

        Get.snackbar(
          "Deleted", "Address removed successfully",
          backgroundColor: Colors.black87, colorText: kwhitecolor,
          // snackPosition: SnackPosition.BOTTOM,
        );
        isLoading = false;
        update();
        log('false');
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
    isLoading = false;
    update();
  }

  void logout() async {
    isLoading = true;
    update();
    await storage.delete(key: 'token');
    await storage.delete(key: 'refreshToken');
    isLoading = false;
    update();

    Get.offAll(() => SignIn());
    signup.logoutLaunch();
    update();
  }
}
