import 'package:essai/models/user.dart';
import 'package:essai/services/authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Getuser {
  Future getUser() async {
    try {
      final session = SupabaseAuthentication().session()!.user;
      final response = await Supabase.instance.client
          .from('profiles')
          .select()
          .eq('id', session.id)
          .single();

      final userProfile = UserModel.fromJson(response as Map<String, dynamic>);
      return userProfile;
    } on PostgrestException catch (_) {
      return UserModel(id: '', email: '', userName: '');
    }
  }
}
