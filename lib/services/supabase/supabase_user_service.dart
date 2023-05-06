import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/user.dart';
import '../../repositories/user_repository.dart';

class SupabaseUserRepository implements UserRepository {
  Session session = Supabase.instance.client.auth.currentSession as Session;

  @override
  Future getUser() async {
    try {
      final response = await Supabase.instance.client
          .from('profiles')
          .select()
          .eq('id', session.user.id)
          .single();

      final userProfile = UserModel.fromJson(response as Map<String, dynamic>);
      return userProfile;
    } catch (e) {
      return e;
    }
  }
}
