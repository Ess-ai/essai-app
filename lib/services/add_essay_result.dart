import 'package:supabase_flutter/supabase_flutter.dart';

import 'authentication.dart';
import '../models/essay_results.dart';

class AddEssayResult {
  Future addEssays(EssayResultsModel essay) async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response =
          await Supabase.instance.client.rpc('create_marked_essay', params: {
        'p_user_id': user.id,
        'p_essay_id': essay.essayId!.id,
        'p_score': essay.score,
        'p_reasons': essay.reasons,
        'p_improvements': essay.improvements,
        'p_grade': essay.grade,
      }).select();

      //final essays = EssayModel.fromJson(response);
      return response;
    } on PostgrestException catch (e) {
      return e;
    }
  }
}
