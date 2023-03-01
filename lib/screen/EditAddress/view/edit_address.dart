import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/core/colors.dart';
import 'package:pixel_gear/screen/Address/address_view.dart';
import 'package:pixel_gear/screen/Address/model/get_addressmodel.dart';

import '../../../util/textfield.dart';
import '../../Address/controller/address_controller.dart';
import '../controller/edit_controller.dart';

class EditAddress extends StatelessWidget {
  EditAddress(
      {super.key,
      required this.width,
      required this.height,
      required this.model});
  final GetAddressModel model;
  final double width;
  final double height;
  final accountC = Get.put(EditContoller());
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    accountC.initial(model);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kblackcolor,
          ),
        ),
        backgroundColor: kwhitecolor,
        centerTitle: true,
        title: const Text(
          'Edit Address',
          style: TextStyle(
            color: kblackcolor,
          ),
        ),
      ),
      body: SafeArea(
          child: GetBuilder<EditContoller>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  kheight20,
                  TextFromFieldWidget(
                    textController: accountC.tittleC,
                    textInputType: TextInputType.name,
                    nullText: 'Title is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.person),
                    text: 'Title',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.fullNameC,
                    textInputType: TextInputType.name,
                    nullText: 'Fullname is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.person),
                    text: 'Full Name',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.phoneC,
                    textInputType: TextInputType.number,
                    nullText: 'Phone number is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.phone),
                    text: 'Phone Number',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.pinC,
                    textInputType: TextInputType.number,
                    nullText: 'Pincode is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.pin),
                    text: 'Pincode',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.stateC,
                    textInputType: TextInputType.name,
                    nullText: 'State is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.public),
                    text: 'State',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.placeC,
                    textInputType: TextInputType.name,
                    nullText: 'Place is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.location_on),
                    text: 'Place',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.addressC,
                    textInputType: TextInputType.streetAddress,
                    nullText: 'Address is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.contact_mail),
                    text: 'Address',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFromFieldWidget(
                    textController: accountC.landmarkC,
                    textInputType: TextInputType.name,
                    nullText: 'Landmark is Empty',
                    obscureText: false,
                    icon: const Icon(Icons.emoji_flags),
                    text: 'Delivery Location',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.4, height * 0.05),
                      backgroundColor: Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        accountC.updateAddress(model.id);

                        Get.off(MyAddress(
                          width: width,
                          height: height,
                        ));
                      }
                      AcountController().getAllAddress();
                    },
                    child: const Text(
                      'U P D A T E',
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
