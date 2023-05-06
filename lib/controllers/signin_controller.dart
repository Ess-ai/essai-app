import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../mixins/handle_exception_mixin.dart';
import '../mixins/loading_mixin.dart';
import '../services/supabase/supabase_authentication.dart';

class SigninController extends GetxController
    with LoadingMixin, HandleExceptions {
  static SigninController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  bool validateEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void signin(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.signInEmailAndPassword(
        email.value.text,
        password.value.text,
      );
      if (res.runtimeType != User) {
        isLoading(false, context);
        handleExceptions(context, res);
      }
    }
  }
}
