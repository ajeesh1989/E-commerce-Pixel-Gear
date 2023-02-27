import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/util/textfield.dart';

import '../controller/address_controller.dart';

class AddAccountPage extends StatelessWidget {
  AddAccountPage({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final accountC = Get.put(AcountController());
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kblackcolor,
            )),
        elevation: 0,
        backgroundColor: kwhitecolor,
        centerTitle: true,
        title: const Text(
          'Add address',
          style: TextStyle(color: kblackcolor),
        ),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(height * 0.04),
        //   child: const SizedBox(),
        // ),
      ),
      body: SafeArea(
          child: GetBuilder<AcountController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  kheight10,
                  TextFromFieldWidget(
                    textController: accountC.tittleC,
                    textInputType: TextInputType.name,
                    nullText: 'Title is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.person),
                    text: 'Title',
                  ),
                  kheight10,
                  TextFromFieldWidget(
                    textController: accountC.fullNameC,
                    textInputType: TextInputType.name,
                    nullText: 'Fullname is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.person),
                    text: 'Full Name',
                  ),
                  kheight10,
                  TextFromFieldWidget(
                    textController: accountC.phoneC,
                    textInputType: TextInputType.number,
                    nullText: 'Phone number is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.phone),
                    text: 'Phone Number',
                  ),
                  kheight10,
                  TextFromFieldWidget(
                    textController: accountC.pinC,
                    textInputType: TextInputType.number,
                    nullText: 'PinCode is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.pin),
                    text: 'Pincode',
                  ),
                  kheight10,
                  TextFromFieldWidget(
                    textController: accountC.stateC,
                    textInputType: TextInputType.name,
                    nullText: 'State is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.public),
                    text: 'State',
                  ),
                  kheight10,
                  TextFromFieldWidget(
                    textController: accountC.placeC,
                    textInputType: TextInputType.name,
                    nullText: 'Place is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.location_on),
                    text: 'Place',
                  ),
                  kheight10,
                  TextFromFieldWidget(
                    textController: accountC.addressC,
                    textInputType: TextInputType.streetAddress,
                    nullText: 'Address is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.contact_mail),
                    text: 'Address',
                  ),
                  kheight10,
                  TextFromFieldWidget(
                    textController: accountC.landmarkC,
                    textInputType: TextInputType.name,
                    nullText: 'Landmark is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.emoji_flags),
                    text: 'Delivery Location',
                  ),
                  kheight20,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.4, height * 0.05),
                      backgroundColor: Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        accountC.addAccount();
                        Get.back();
                      }
                    },
                    child: const Text(
                      'S U B M I T',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
