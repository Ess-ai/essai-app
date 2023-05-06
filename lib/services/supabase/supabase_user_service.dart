import 'package:essai/services/storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/user.dart';
import '../../repositories/user_repository.dart';

class SupabaseUserServices implements UserRepository {
  final storage = Storage();
  @override
  Future getUser(id) async {
    try {
      final response = await Supabase.instance.client
          .from('profiles')
          .select()
          .eq('id', id)
          .single();

      final userProfile = UserModel.fromJson(response as Map<String, dynamic>);
      await storage.storage.setItem('user', userProfile);
      return userProfile;
    } catch (e) {
      return e;
    }
  }
}
