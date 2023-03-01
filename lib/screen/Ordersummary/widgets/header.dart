import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Address/address_view.dart';
import 'package:pixel_gear/screen/Address/widget/add_address.dart';

import '../../Cart/controller/cart_controller.dart';
import 'addresstile.dart';

class BeforeBottom extends StatelessWidget {
  const BeforeBottom({
    Key? key,
    required this.cartcontrol,
  }) : super(key: key);

  final CartController cartcontrol;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          kheight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Deliver to:'),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 255, 255, 255)),
                      elevation: MaterialStateProperty.all(0),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: kblackcolor))),
                  onPressed: () {
                    Get.to(MyAddress(
                      height: Get.height,
                      width: Get.width,
                      key: key,
                    ));
                  },
                  child: const Text(
                    'Change',
                    style: TextStyle(color: kblackcolor),
                  ))
            ],
          ),
          const AddressContainer(),
        ],
      ),
    );
  }
}
