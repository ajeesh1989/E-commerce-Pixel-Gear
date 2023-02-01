import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';

class DioException {
  void dioError(Object e) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        Get.snackbar('Incorrect', "Invalid username or password",
            backgroundColor: Colors.black54, colorText: kwhitecolor);
      } else if (e.response?.statusCode == 400) {
        Get.snackbar('Error', "All field required",
            backgroundColor: Colors.black54, colorText: kwhitecolor);
      } else if (e.response?.statusCode == 403) {
        Get.snackbar('Forbidden', "Please logout",
            backgroundColor: Colors.black54, colorText: kwhitecolor);
      } else if (e.response?.statusCode == 500) {
        Get.snackbar('Error', "Something went wrong",
            backgroundColor: Colors.black54, colorText: kwhitecolor);
      } else if (e.toString() ==
          "[Error]: (006) Request Throttled. Over Rate limit: up to 2 per sec. See geocode.xyz/pricing") {
        Get.snackbar('Error', "Failed, Please try again",
            backgroundColor: Colors.black54, colorText: kwhitecolor);
      }
    }
    if (e is SocketException) {
      Get.snackbar('Network', "No Internet Connection",
          backgroundColor: Colors.black54, colorText: kwhitecolor);
    } else if (e is TimeoutException) {
      Get.snackbar('Connection', "Connection Timedout",
          backgroundColor: Colors.black54, colorText: kwhitecolor);
    }
  }
}
