import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/model/productmodel.dart';
import 'package:pixel_gear/screen/Home/view/widgets/home_grid.dart';
import 'package:pixel_gear/screen/Wishlist/controller/wishlist_controller.dart';
import 'package:pixel_gear/screen/product/controller/productController.dart';
import 'package:pixel_gear/screen/product/view/product.dart';

class AllProductsPage extends StatelessWidget {
  AllProductsPage({super.key, required this.categoryid});

  double height = Get.size.height;
  double width = Get.size.width;
  final homeC = Get.put(HomeController());
  String categoryid;
  final apibaseUrl = ApiBaseUrl();
  final wishlistcontroller = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    final findbycategory = homeC.findByCategoryId(categoryid);
    List<ProductModel> productList = findbycategory
        .where((element) => element.category.contains(categoryid))
        .toList();
    log(findbycategory[0].category);
    log(categoryid, name: 'categoryCheck');

    log(productList.length.toString());
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: kblackcolor,
            ),
          ),
          elevation: 0,
          backgroundColor: kwhitecolor,
          centerTitle: true,
          title: const Text(
            'All Products',
            style: TextStyle(color: kblackcolor),
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.37,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext ctx, int index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => ProductScreen(
                              height: height,
                              width: width,
                              productid: productList[index].id,
                            ),
                          );
                          // productC.toProdutScreen(index);
                        },
                        child: CustomCard(
                          elevation: 10,
                          child: SizedBox(
                            width: width * 0.5,
                            height: height * 0.3,
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.16,
                                  width: width * 0.50,
                                  decoration: BoxDecoration(
                                    color: greycolor,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${apibaseUrl.baseUrl}/products/${productList[index].image[0]}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                kheight10,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 1),
                                  child: Text(
                                    productList[index].description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ),
                                kheight10,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "₹ ${productList[index].price.toString()}",
                                          style: const TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${productList[index].rating.toString()}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * 0.346,
                      top: height * 0.01,
                      child: GetBuilder<WishListController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            wishlistcontroller
                                .addOrRemoveFromWishlist(productList[index].id);
                          },
                          icon: wishlistcontroller.wishList.isEmpty
                              ? const Icon(Icons.favorite_border_outlined)
                              : Icon(
                                  wishlistcontroller.wishList
                                          .contains(productList[index].id)
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: wishlistcontroller.wishList.isEmpty
                                      ? kblackcolor
                                      : wishlistcontroller.wishList
                                              .contains(productList[index].id)
                                          ? kblackcolor
                                          : Colors.black45,
                                ),
                        ),
                      ),
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
