import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase.dart';

class SupabaseAuthentication {
  Future<dynamic> signInWithPassword(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw UnimplementedError();
      }

      return user.id;
    } on AuthException catch (e) {
      return e;
    }
  }

  Future<dynamic> signUpEmailAndPassword(String email, String password) async {
    try {
      final response =
          await supabase.auth.signUp(email: email, password: password);

      final user = response.user;
      return user!.id;
    } on AuthException catch (e) {
      return e;
    }
  }

  Future<dynamic> updateUserAttribute(String password) async {
    try {
      final response =
          await supabase.auth.updateUser(UserAttributes(password: password));

      final user = response.user;
      return user!.id;
    } on AuthException catch (e) {
      return e;
    }
  }

  Future<dynamic> sendRecoveryOtp(String email) async {
    try {
      await supabase.auth.signInWithOtp(email: email);

      var res =
          'You have recieved a password recovery code in your inbox. Check your Email';
      return res;
    } on AuthException catch (e) {
      return e;
    }
  }

  Future<dynamic> verifyOtp(String email, String token) async {
    try {
      final AuthResponse response = await supabase.auth
          .verifyOTP(email: email, token: token, type: OtpType.magiclink);

      return response.user!.id;
    } on AuthException catch (e) {
      return e;
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    return;
  }

  Session? session() {
    final session = supabase.auth.currentSession;
    return session;
  }
}
