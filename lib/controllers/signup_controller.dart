import 'package:essai/pages/app/widgets/snack_message.dart';
import 'package:essai/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController {
  static SignUpController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final auth = SupabaseAuthentication();
  final email = TextEditingController();
  final password = TextEditingController();

  bool validateEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future signup(String email, String password) async {
    final userId = await auth.signUpEmailAndPassword(email, password);
    return userId;
  }

  login(email, password, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      SnackMessage(
        state: 'Loading',
        context: context,
      ).snackMessage();
      await signup(email, password).then((value) {
        if (value == null) {
          SnackMessage(
            state: 'Message',
            context: context,
            color: Colors.red,
            message: "Invalid. Retry",
          ).snackMessage();
        } else {
          if (value.runtimeType == AuthException) {
            final AuthException res = value;
            SnackMessage(
              state: 'Message',
              context: context,
              color: Colors.red,
              message: res.message,
            ).snackMessage();
          } else {
            SnackMessage(
              state: 'Message',
              context: context,
              color: Colors.blue,
              message: "Check your Email Inbox to verify your email",
            ).snackMessage();
          }
        }
      });
    }
  }
}
