import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Cart/view/cart.dart';
import 'package:pixel_gear/screen/MyAccount/view/myaccount.dart';
import 'package:pixel_gear/screen/Search/view/search.dart';

import '../../home/view/home.dart';
import '../Controller/controller.dart';

class BottomNavPage extends GetView<BottomNavigationController> {
  BottomNavigationController navigationController =
      Get.put(BottomNavigationController());

  BottomNavPage({super.key});

  final screen = [
    const HomePage(),
    const CategoryPage(),
    const CartPage(),
    const MyAccountPage(),
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
              icon: Icon(Icons.shopping_cart, color: kblackcolor),
              label: 'MyCart',
              backgroundColor: kwhitecolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: kblackcolor),
              label: 'Account',
              backgroundColor: kwhitecolor,
            ),
          ],
        ),
      ),
    );
  }
}
