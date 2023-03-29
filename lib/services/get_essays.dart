import 'package:essai/models/essay.dart';
import 'package:essai/services/authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetEssays {
  Future<List<dynamic>> getEssays() async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response = await Supabase.instance.client
          .from('essays')
          .select(
              'id, essay_category(id, essay_category_name), essay_title, essay_body, created_at, is_submitted')
          .eq('user_id', user.id);

      final essays =
          response.map((essay) => EssayModel.fromJson(essay)).toList();
      return essays;
    } on PostgrestException catch (e) {
      print('Message${e.message}');
      return List.empty();
    }
  }
}
