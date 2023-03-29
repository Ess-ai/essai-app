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
    } on PostgrestException catch (_) {
      return List.empty();
    }
  }

  Future getEssay(id) async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response = await Supabase.instance.client
          .from('essays')
          .select(
              'id, essay_category(id, essay_category_name), essay_title, essay_body, created_at, is_submitted')
          .eq('user_id', user.id)
          .eq('id', id)
          .single();

      final essay = EssayModel.fromJson(response);
      return essay;
    } on PostgrestException catch (e) {
      return e;
    }
  }

  Future getEssayResult(id) async {
    try {
      final user = SupabaseAuthentication().session()!.user;
      final response = await Supabase.instance.client
          .from('essay_results')
          .select(
              'id, essay_category(id, essay_category_name), essay_title, essay_body, created_at, is_submitted')
          .eq('user_id', user.id)
          .eq('id', id);

      final essay = EssayModel.fromJson(response);
      return essay;
    } on PostgrestException catch (e) {
      return e;
    }
  }
}
