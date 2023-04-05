import 'package:essai/models/essay.dart';
import 'package:essai/services/authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddEssay {
  Future addEssays(EssayModel essay) async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response = await Supabase.instance.client.from('essays').insert({
        'user_id': user.id,
        'essay_category': essay.essayCategory!.id,
        'essay_title': essay.essayTitle,
        'essay_body': essay.essayBody,
        'is_submitted': essay.isSubmitted
      }).select();

      //final essays = EssayModel.fromJson(response);
      print(response);
      return response;
    } on PostgrestException catch (e) {
      print(e);
      return e;
    }
  }
}
