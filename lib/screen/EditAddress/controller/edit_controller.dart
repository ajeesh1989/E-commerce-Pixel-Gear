import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/Account/Controller/account_controller.dart';

import '../../Address/controller/address_controller.dart';
import '../../Address/model/get_addressmodel.dart';
import '../model/edit_model.dart';
import '../service/edit_service.dart';

class EditContoller extends GetxController {
  initial(GetAddressModel model) {
    tittleC = TextEditingController(text: model.title);
    fullNameC = TextEditingController(text: model.fullName);
    phoneC = TextEditingController(text: model.phone);
    pinC = TextEditingController(text: model.pin);
    stateC = TextEditingController(text: model.state);
    placeC = TextEditingController(text: model.place);
    addressC = TextEditingController(text: model.address);
    landmarkC = TextEditingController(text: model.landMark);
  }

  final accountC = Get.put(AcountController());

  TextEditingController tittleC = TextEditingController();
  TextEditingController fullNameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController pinC = TextEditingController();
  TextEditingController stateC = TextEditingController();
  TextEditingController placeC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController landmarkC = TextEditingController();
  bool isLoading = false;
  void updateAddress(String addressId) async {
    isLoading = true;
    update();
    final EditAddressModel model = EditAddressModel(
      title: tittleC.text,
      fullName: fullNameC.text,
      phone: phoneC.text,
      pin: pinC.text,
      state: stateC.text,
      place: placeC.text,
      address: addressC.text,
      landMark: landmarkC.text,
    );
    await Editservice().updateAddress(model, addressId).then((value) {
      if (value != null) {
        accountC.getAllAddress();
        update();

        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
      accountC.getAllAddress();
    });
    return null;
  }
}
