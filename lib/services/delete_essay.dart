import 'package:essai/models/essay.dart';
import 'package:essai/services/authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EssayDelete {
  Future deleteEssay(EssayModel essay) async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response = await Supabase.instance.client
          .from('essays')
          .delete()
          .eq('id', essay.id)
          .eq('user_id', user.id);

      //final essays = EssayModel.fromJson(response);
      return response;
    } on PostgrestException catch (e) {
      return e;
    }
  }
}
