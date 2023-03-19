import 'package:essai/pages/app/dashboard.dart';
import 'package:essai/pages/auth/signin.dart';
import 'package:essai/services/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final service = Services();

class SplashController extends GetxController {
  static SplashController get find => Get.find();

  Future loadScreen() async {
    await Future.wait([
      SupabaseAuth.instance.initialSession,
      Future.delayed(
        const Duration(milliseconds: 2000),
      ),
    ]).then((responseList) async {
      final session = responseList.first as Session?;
      if (session != null) {
        Get.to(const Dashboard());
      } else {
        Get.to(const Signin());
      }
    }).catchError((_) {
      Get.to(const Signin());
    });
  }
}
