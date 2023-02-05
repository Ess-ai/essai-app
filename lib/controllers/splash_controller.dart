import 'package:essai/pages/auth/signin.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get find => Get.find();

  Future loadScreen() async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
    );
    Get.to(Signin());
  }
}
