import 'package:supabase_flutter/supabase_flutter.dart';

import 'authentication.dart';
import '../models/essay_results.dart';

class AddEssayResult {
  Future addEssays(EssayResultsModel essay) async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response =
          await Supabase.instance.client.from('essays').insert({}).select();

      //final essays = EssayModel.fromJson(response);
      return response;
    } on PostgrestException catch (e) {
      return;
    }
  }
}
