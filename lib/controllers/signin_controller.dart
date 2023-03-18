import 'package:essai/pages/app/widgets/snack_message.dart';
import 'package:essai/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInController {
  static SignInController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final auth = SupabaseAuthentication();
  final email = TextEditingController();
  final password = TextEditingController();

  bool validateEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future signin(String email, String password) async {
    final userId = await auth.signInWithPassword(email, password);
    return userId;
  }

  login(email, password) async {
    if (formKey.currentState!.validate()) {
      const SnackMessage(state: 'Loading');
      /*signin(email, password).then((value) {
        if (value == null) {
          const SnackMessage(
            state: 'Message',
            color: Colors.red,
            message: "Invalid Credentials. Retry",
          );
        } else {
          if (value.runtimeType == AuthException) {
            final AuthException res = value;
            SnackMessage(
              state: 'Message',
              color: Colors.red,
              message: res.message,
            );
          } else {
            const SnackMessage(
              state: 'Message',
              color: Colors.blue,
              message: "Welcome",
            );
          }
        }
      });
    */
    }
  }
}
