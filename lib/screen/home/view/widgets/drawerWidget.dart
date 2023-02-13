import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/Account/Controller/account_controller.dart';

class DrawerWidget extends GetView {
  DrawerWidget({
    super.key,
  });
  final accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: DrawerHeader(
              margin: EdgeInsets.only(bottom: 0, top: 5),
              child: Text(
                'P i x e l  G e a r',
                textAlign: TextAlign.center,
                style: (TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                )),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text(
              'Back to home',
              style: TextStyle(fontSize: 16, color: Colors.black54),
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
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                leading: const Icon(
                  Icons.person,
                ), //add icon
                childrenPadding:
                    const EdgeInsets.only(left: 60), //children padding
                children: [
                  ListTile(
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const Text("My orders"),
                    onTap: () {
                      //action on press
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_border),
                    title: const Text("My wishlist"),
                    onTap: () {
                      //action on press
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart_outlined),
                    title: const Text("My cart"),
                    onTap: () {
                      //action on press
                    },
                  ),
                ],
              ),
            ],
          ),
          ListTile(
            leading: const Icon(
              Icons.book_outlined,
            ),
            title: const Text(
              'Terms & conditions',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.camera,
            ),
            title: const Text(
              'About   P i x e l  G e a r ',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            onTap: () {
              Get.back();
            },
          ),
          TextButton(
            onPressed: () {
              accountController.logout();
            },
            child: ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text(
                'Log out',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
