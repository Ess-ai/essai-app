import 'package:essai/services/authentication.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final auth = SupabaseAuthentication();
  final email = TextEditingController();
  final password = TextEditingController();

  Future signup(String email, String password) async {
    final userId = await auth.signUpEmailAndPassword(email, password);
    return userId;
  }
}

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
