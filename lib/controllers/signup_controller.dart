import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../mixins/handle_exception_mixin.dart';
import '../mixins/loading_mixin.dart';
import '../services/supabase/supabase_authentication.dart';

class SignupController extends GetxController
    with LoadingMixin, HandleExceptions {
  static SignupController get instance => Get.find();

  final auth = SupabaseAuthentication();

  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool validateEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  signup(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.signUpEmailAndPassword(
        email.text,
        password.text,
      );
      if (res.runtimeType != User) {
        isLoading(false, context);
        handleExceptions(context, res);
      } else {}
    }
  }
}
