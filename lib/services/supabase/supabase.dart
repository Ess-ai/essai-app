import 'package:essai/pages/app/dashboard.dart';
import 'package:essai/pages/auth/signin.dart';
import 'package:essai/services/supabase/supabase_user_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../controllers/secret_loader_controller.dart';
import '../../models/secret.dart';

class SupabaseService {
  Future<void> init() async {
    Secret secret = await SecretLoader().load();

    await Supabase.initialize(
      url: secret.supabaseUrl,
      anonKey: secret.supabaseAnonKey,
    );
  }

  void listentoHeaders() {
    /// Listen for authentication events and redirect to
    /// correct page when key events are detected.
    Supabase.instance.client.auth.onAuthStateChange.listen((authState) async {
      final event = authState.event;
      final session = authState.session;
      if (event == AuthChangeEvent.signedIn) {
        if (session != null) {
          await SupabaseUserServices().getUser(session.user.id);
          Get.to(const Dashboard());
        } else {
          Get.to(const Signin());
        }
      } else if (event == AuthChangeEvent.signedOut) {
        Get.to(const Signin());
      }
    });
  }
}
