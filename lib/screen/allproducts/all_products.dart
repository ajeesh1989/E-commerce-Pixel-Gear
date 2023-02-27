import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Wishlist/controller/wishlist_controller.dart';
import 'package:pixel_gear/screen/Wishlist/view/wishlist.dart';
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
    log(categoryid, name: '1111');
    return Scaffold(
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
        actions: [
          TextButton(
              onPressed: () {
                Get.to(
                  () => WishlistPage(height: height, width: width),
                );
              },
              child: Text('Wishlist'))
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => categoryid.isEmpty
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: findbycategory.length,
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
                                  productid: findbycategory[index].id,
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
                                                '${apibaseUrl.baseUrl}/products/${findbycategory[index].image[0]}'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    kheight10,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 1),
                                      child: Text(
                                        findbycategory[index].description,
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
                                              "₹ ${findbycategory[index].price.toString()}",
                                              style: const TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            findbycategory[index].rating,
                                            style:
                                                const TextStyle(fontSize: 15),
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
                                wishlistcontroller.addOrRemoveFromWishlist(
                                    findbycategory[index].id);
                              },
                              icon: wishlistcontroller.wishList.isEmpty
                                  ? const Icon(Icons.favorite_border_outlined)
                                  : Icon(
                                      wishlistcontroller.wishList.contains(
                                              findbycategory[index].id)
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: wishlistcontroller.wishList.isEmpty
                                          ? kblackcolor
                                          : wishlistcontroller.wishList
                                                  .contains(
                                                      findbycategory[index].id)
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
    );
  }
}
