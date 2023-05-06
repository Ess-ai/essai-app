import 'package:supabase_flutter/supabase_flutter.dart';

import '../../repositories/authentication_repository.dart';

class SupabaseAuthentication implements AuthenticationRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  @override
  Future signInEmailAndPassword(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw UnimplementedError();
      }

      return user;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  @override
  Future signUpEmailAndPassword(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: "io.supabase.audread://login-callback/",
      );

      final user = response.user;
      return user;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  @override
  Future verifySignUp(String email, String token) async {
    try {
      final AuthResponse response = await _supabaseClient.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.signup,
      );

      return response.user;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  @override
  Future sendRecoveryCode(String email) async {
    try {
      await _supabaseClient.auth.signInWithOtp(email: email);

      var res = 'You have recieved a password recovery code in your inbox.';
      return res;
    } catch (e) {
      return e;
    }
  }

  @override
  Future verifyRecoveryCode(String email, String token) async {
    try {
      final AuthResponse response = await _supabaseClient.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.magiclink,
      );

      return response.user!.id;
    } catch (e) {
      return e;
    }
  }

  @override
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
    return;
  }
}
