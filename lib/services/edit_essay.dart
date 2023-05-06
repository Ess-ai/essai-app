import 'package:essai/models/essay.dart';
import 'package:essai/services/authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EssayEdit {
  Future editEssays(EssayModel essay) async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response = await Supabase.instance.client
          .from('essays')
          .update({
            'essay_title': essay.essayTitle,
            'essay_body': essay.essayBody,
            'is_submitted': essay.isSubmitted
          })
          .eq('id', essay.id)
          .eq('user_id', user.id);

      //final essays = EssayModel.fromJson(response);
      return response;
    } on PostgrestException {
      return;
    }
  }
}
