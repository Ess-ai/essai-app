import 'package:essai/constants.dart';
import 'package:essai/pages/app/dashboard.dart';
import 'package:essai/pages/auth/signin.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SupabaseService {
  final String supabaseUrl = AppConstants().supabaseUrl;
  final String supabaseAnonKey = AppConstants().supabaseAnonKey;

  Future<void> init() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  void listentoHeaders() {
    /// Listen for authentication events and redirect to
    /// correct page when key events are detected.
    Supabase.instance.client.auth.onAuthStateChange.listen((authState) {
      final event = authState.event;
      final session = authState.session;
      if (event == AuthChangeEvent.signedIn) {
        if (session != null) {
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
