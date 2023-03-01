import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/api/api_baseurl.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/controller/cart_controller.dart';
import 'package:pixel_gear/screen/Cart/view/cart.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Home/view/shimmers/productshimmer.dart';
import 'package:pixel_gear/screen/Wishlist/controller/wishlist_controller.dart';
import 'package:pixel_gear/screen/product/view/product.dart';

class WishlistPage extends GetView<WishListController> {
  WishlistPage({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  final apibaseUrl = ApiBaseUrl();
  final wishListController = Get.put(
    WishListController(),
  );
  final productC = Get.put(
    HomeController(),
  );
  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => MyCart(height: height, width: width));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: kblackcolor,
              ),
            ),
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: kwhitecolor,
          title: const Text(
            'My wishlist',
            style: TextStyle(color: kblackcolor),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.arrow_back,
              color: kblackcolor,
            ),
          ),
        ),
        body: controller.isLoading == true
            ? const ProductShimmer()
            : controller.wishList.isEmpty
                ? Column(
                    children: [
                      kheight80,
                      Image.asset('lib/images/emptywishlist.jpg'),
                      const Text(
                        'Your wishlist is empty!',
                        style: TextStyle(fontSize: 20, color: kblackcolor),
                      ),
                      kheight10,
                      const Text(
                        'Explore more and shortlist some items.',
                        style: TextStyle(fontSize: 16, color: greycolor),
                      )
                    ],
                  )
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: wishListController.wishList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.55,
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
                                  ProductScreen(
                                    height: height,
                                    width: width,
                                    productid: wishListController.wishlistmodel!
                                        .products[index].product.id,
                                  ),
                                );
                              },
                              child: CustomCard(
                                elevation: 20,
                                child: SizedBox(
                                  width: width * 0.6,
                                  height: height * 0.5,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: height * 0.16,
                                        width: width * 0.50,
                                        decoration: BoxDecoration(
                                          color: greycolor,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '${apibaseUrl.baseUrl}/products/${wishListController.wishlistmodel!.products[index].product.image[0]}'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      kheight10,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 1),
                                        child: Text(
                                          wishListController
                                              .wishlistmodel!
                                              .products[index]
                                              .product
                                              .description,
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
                                                "₹${wishListController.wishlistmodel!.products[index].product.price - wishListController.wishlistmodel!.products[index].product.discountPrice}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              wishListController
                                                  .wishlistmodel!
                                                  .products[index]
                                                  .product
                                                  .rating
                                                  .toString(),
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
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: const BorderSide(
                                                  color: greycolor),
                                            ),
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                            Size(width * 0.3, height * 0.03),
                                          ),
                                        ),
                                        onPressed: () {
                                          cartC.addToCart(
                                              wishListController.wishlistmodel!
                                                  .products[index].product.id,
                                              wishListController
                                                  .wishlistmodel!
                                                  .products[index]
                                                  .product
                                                  .size[0]);
                                          Get.to(() => MyCart(
                                              height: height, width: width));
                                        },
                                        child: const Text(
                                          'Add to cart',
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: width * 0.369,
                            top: height * 0.010,
                            child: GetBuilder<WishListController>(
                              builder: (controller) => IconButton(
                                onPressed: () {
                                  wishListController.addOrRemoveFromWishlist(
                                      wishListController.wishlistmodel!
                                          .products[index].product.id);
                                },
                                icon: wishListController.wishList.isEmpty
                                    ? const Icon(Icons.favorite_border_outlined)
                                    : Icon(
                                        wishListController.wishList.contains(
                                                wishListController
                                                    .wishlistmodel!
                                                    .products[index]
                                                    .product
                                                    .id)
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: wishListController
                                                .wishList.isEmpty
                                            ? kblackcolor
                                            : wishListController.wishList
                                                    .contains(wishListController
                                                        .wishlistmodel!
                                                        .products[index]
                                                        .product
                                                        .id)
                                                ? Colors.black
                                                : kblackcolor,
                                      ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
      ),
    );
  }
}
