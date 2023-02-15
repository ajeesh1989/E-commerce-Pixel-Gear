import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Search/view/search.dart';
import 'package:pixel_gear/screen/Category/view/category.dart';
import 'package:pixel_gear/screen/Wishlist/view/wishlist.dart';

import '../../home/view/home.dart';
import '../Controller/controller.dart';

// ignore: must_be_immutable
class BottomNavPage extends GetView<BottomNavigationController> {
  BottomNavigationController navigationController =
      Get.put(BottomNavigationController());

  BottomNavPage({super.key});

  final screen = [
    HomePage(),
    CategoryPage(),
    const SearchPage(),
    const WishlistPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        (() => IndexedStack(
              index: navigationController.selectedIndex.value,
              children: screen,
            )),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: kwhitecolor,
          selectedItemColor: kblackcolor,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            navigationController.changeIndex(index);
          },
          currentIndex: navigationController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: kblackcolor),
              label: 'Home',
              backgroundColor: kwhitecolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera, color: kblackcolor),
              label: 'Category',
              backgroundColor: kwhitecolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: kblackcolor),
              label: 'Search',
              backgroundColor: kwhitecolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, color: kblackcolor),
              label: 'Wish list',
              backgroundColor: kwhitecolor,
            ),
          ],
        ),
      ),
    );
  }
}
