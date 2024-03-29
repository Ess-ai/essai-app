import 'package:essai/models/user.dart';
import 'package:essai/services/storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:essai/repositories/essay_repository.dart';

import '../../models/essay.dart';
import '../../models/essay_results.dart';

class SupabaseEssayServices implements EssayRepository {
  final usr = Storage().storage.getItem('user');

  @override
  Future getEssays() async {
    final user = UserModel.fromJson(usr);
    try {
      final response = await Supabase.instance.client
          .from('essays')
          .select(
            'id, essay_category, essay_title, essay_body, created_at, is_submitted, created_at',
          )
          .eq('user_id', user.id)
          .order('created_at', ascending: false);

      final essays =
          response.map((essay) => EssayModel.fromJson(essay)).toList();
      return essays;
    } catch (e) {
      return e;
    }
  }

  @override
  Future getEssay(String id) async {
    final user = UserModel.fromJson(usr);
    try {
      final response = await Supabase.instance.client
          .from('essays')
          .select(
            'id, essay_category, essay_title, essay_body, created_at, is_submitted',
          )
          .eq('user_id', user.id)
          .eq('id', id)
          .single();

      final essay = EssayModel.fromJson(response);
      return essay;
    } catch (e) {
      return e;
    }
  }

  @override
  Future getEssayResults(String id) async {
    try {
      final response = await Supabase.instance.client
          .from('essay_results')
          .select(
            'id, essay_score, reasons, essay_grade, improvements,essay_id(id, essay_category))',
          )
          .eq('essay_id', id)
          .single();

      final essay = EssayResultsModel.fromJson(response);
      return essay;
    } catch (e) {
      return e;
    }
  }
}
