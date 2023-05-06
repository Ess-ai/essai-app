import 'package:essai/pages/app/dashboard.dart';
import 'package:essai/pages/auth/signin.dart';
import 'package:essai/services/services.dart';
import 'package:essai/services/supabase/supabase_user_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final service = Services();

class SplashController extends GetxController {
  static SplashController get find => Get.find();

  Future loadScreen() async {
    await Future.wait([
      Future.delayed(
        const Duration(milliseconds: 2000),
      ),
    ]);

    try {
      final session = await SupabaseAuth.instance.initialSession;
      if (session != null) {
        await SupabaseUserServices().getUser(session.user.id);
        Get.to(const Dashboard());
      } else {
        Get.to(const Signin());
      }
    } catch (_) {
      Get.to(const Signin());
    }
  }
}
