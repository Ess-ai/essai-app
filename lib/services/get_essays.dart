import 'package:essai/models/essay.dart';
import 'package:essai/services/authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetEssays {
  Future<List<dynamic>> getEssays() async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response = await Supabase.instance.client
          .from('essays')
          .select()
          .eq('user_id', user.id);

      final essays =
          response.map((essay) => EssayModel.fromJson(essay)).toList();
      return essays;
    } on PostgrestException catch (e) {
      return [e];
    }
  }
}
