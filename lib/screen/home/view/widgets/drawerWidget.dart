import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Account/Controller/account_controller.dart';
import 'package:pixel_gear/screen/Address/address_view.dart';
import 'package:pixel_gear/screen/Cart/view/cart.dart';
import 'package:pixel_gear/screen/Home/controller/home_controller.dart';
import 'package:pixel_gear/screen/Order_place/view/order_place.dart';
import 'package:pixel_gear/screen/Wishlist/view/wishlist.dart';

class DrawerWidget extends GetView {
  DrawerWidget({
    super.key,
  });
  final accountController = Get.put(AccountController());
  double height = Get.size.height;
  double width = Get.size.width;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey.shade900),
              // margin: const EdgeInsets.only(bottom: 0, top: 0),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.linked_camera_outlined,
                          size: 50,
                          color: kwhitecolor,
                        ),
                        kwidth10,
                        RichText(
                          text: const TextSpan(
                            text: 'P i x e l  ',
                            style: TextStyle(
                                color: kwhitecolor,
                                fontSize: 21,
                                fontWeight: FontWeight.w300),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'G e a r',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ''),
                            ],
                          ),
                        ),
                        // Text(
                        //   'P i x e l  G e a r',
                        //   textAlign: TextAlign.center,
                        //   style: (TextStyle(
                        //     fontSize: 20,
                        //     color: kwhitecolor,
                        //     fontWeight: FontWeight.w400,
                        //   )),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            kheight20,
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.black54,
              ),
              title: const Text(
                'Back to home',
                style: TextStyle(fontSize: 16, color: kblackcolor),
              ),
              onTap: () {
                Get.back();
              },
            ),
            Column(
              children: [
                ExpansionTile(
                  title: const Text(
                    "My Account",
                    style: TextStyle(fontSize: 16, color: kblackcolor),
                  ),
                  leading: const Icon(
                    Icons.person_outline,
                    color: Colors.black54,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black54,
                      ),
                      title: const Text(
                        "My orders",
                        style: TextStyle(color: kblackcolor),
                      ),
                      onTap: () {
                        Get.to(() => OrderPlace(
                              height: height,
                              width: width,
                            ));
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.favorite_border,
                        color: Colors.black54,
                      ),
                      title: GestureDetector(
                          onTap: () {
                            Get.to(WishlistPage(height: height, width: width));
                          },
                          child: const Text("My wishlist")),
                      onTap: () {
                        //action on press
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black54,
                      ),
                      title: GestureDetector(
                          onTap: () {
                            Get.to(MyCart(height: height, width: width));
                          },
                          child: const Text("My cart")),
                      onTap: () {
                        //action on press
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.navigation_outlined,
                        color: Colors.black54,
                      ),
                      title: GestureDetector(
                          onTap: () {
                            Get.to(MyAddress(
                              height: height,
                              width: width,
                            ));
                          },
                          child: const Text("My Address")),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.book_outlined,
                color: Colors.black54,
              ),
              title: const Text(
                'Terms & conditions',
                style: TextStyle(fontSize: 16, color: kblackcolor),
              ),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.black54,
              ),
              title: const Text(
                'Privacy policy',
                style: TextStyle(fontSize: 16, color: kblackcolor),
              ),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: Colors.black54,
              ),
              title: const Text(
                'About   P i x e l  G e a r ',
                style: TextStyle(fontSize: 16, color: kblackcolor),
              ),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.black54,
              ),
              title: const Text(
                'Log out',
                style: TextStyle(fontSize: 16, color: kblackcolor),
              ),
              onTap: () {
                accountController.logout();
              },
            ),
            // TextButton(
            //   onPressed: () {
            //     accountController.logout();
            //   },
            //   child: const ListTile(
            //     leading: Icon(
            //       Icons.logout,
            //       color: Colors.black54,
            //     ),
            //     title: Text(
            //       'Log out',
            //       style: TextStyle(fontSize: 16, color: kblackcolor),
            //     ),
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.only(top: 100.0, left: 115),
              child: Text('version  1.0'),
            ),
          ],
        ),
      ),
    );
  }
}
