import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Search/widgets/searchshimmers.dart';
import 'package:pixel_gear/screen/product/view/product.dart';
import 'package:pixel_gear/util/Box/box.dart';

import '../../Home/controller/home_controller.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({
    super.key,
  });

  double height = Get.size.height;
  double width = Get.size.width;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: GetBuilder<HomeController>(
              builder: (controller) {
                return Column(
                  children: [
                    SizedBox(
                      height: 45,
                      child: Box(
                        child: CupertinoSearchTextField(
                          prefixInsets:
                              const EdgeInsetsDirectional.fromSTEB(10, 4, 5, 3),
                          backgroundColor: Color.fromARGB(255, 243, 243, 246),
                          controller: homeController.searchController,
                          onChanged: (value) {
                            homeController.searchs(value);
                          },
                        ),
                      ),
                    ),
                    kheight20,
                    homeController.searchResult.isEmpty
                        ? SizedBox(
                            height: Get.size.height * 0.6,
                            child: const Center(
                              child: Text(
                                'No Search Results Found',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        : homeController.isLoading == true
                            ? const NewlyLaunchedShimmer()
                            : ListView.separated(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => ProductScreen(
                                          height: height,
                                          width: width,
                                          productid: homeController
                                              .productList[index].id,
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            kwidth10,
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: NetworkImage(
                                                  '${ApiBaseUrl().baseUrl}/products/${homeController.searchResult[index].image[0]}',
                                                ),
                                              )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    homeController
                                                        .searchResult[index]
                                                        .name,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: double.parse(
                                                        homeController
                                                            .searchResult[index]
                                                            .rating),
                                                    itemSize: 15,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    ignoreGestures: true,
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate:
                                                        (startRating) {
                                                      log(startRating
                                                          .toString());
                                                    },
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "${homeController.searchResult[index].offer}%Off",
                                                        style: const TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          fontFamily: "Manrope",
                                                        ),
                                                      ),
                                                      kwidth10,
                                                      Text(
                                                        "₹${homeController.searchResult[index].price}",
                                                        style: const TextStyle(
                                                          color: greycolor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontFamily: "Manrope",
                                                        ),
                                                      ),
                                                      kwidth10,
                                                      Text(
                                                        "₹${(homeController.searchResult[index].price - homeController.searchResult[index].discountPrice).round()}",
                                                        style: const TextStyle(
                                                          color: kblackcolor,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: "Manrope",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        kheight10,
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 1,
                                  );
                                },
                                itemCount: homeController.searchResult.length,
                              ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
