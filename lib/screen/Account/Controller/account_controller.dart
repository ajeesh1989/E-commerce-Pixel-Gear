import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pixel_gear/screen/BottomNavBar/Controller/controller.dart';
import 'package:pixel_gear/screen/auth/sign_in/view/signin.dart';

class AccountController extends GetxController {
  bool isLoading = false;
  bool isLoading2 = false;

  FlutterSecureStorage storage = const FlutterSecureStorage();
  final bottom = Get.put(BottomNavigationController());
  void logout() async {
    isLoading = true;
    update();
    await storage.delete(key: 'token');
    await storage.delete(key: 'refreshToken');

    Get.offAll(() => SignIn());
    bottom.selectedIndex = 0.obs;
    isLoading = false;
    update();
  }
}
