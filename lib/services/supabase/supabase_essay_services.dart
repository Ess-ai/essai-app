import 'package:essai/services/storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:essai/repositories/essay_repository.dart';

import '../../models/essay.dart';
import '../../models/essay_results.dart';

class SupabaseEssayServices implements EssayRepository {
  final user = Storage().storage.getItem('user');

  @override
  Future getEssays() async {
    try {
      final response = await Supabase.instance.client
          .from('essays')
          .select(
            'id, essay_category(id, essay_category_name), essay_title, essay_body, created_at, is_submitted',
          )
          .eq('user_id', user.id);

      final essays =
          response.map((essay) => EssayModel.fromJson(essay)).toList();
      return essays;
    } catch (e) {
      return e;
    }
  }

  @override
  Future getEssay(String id) async {
    try {
      final response = await Supabase.instance.client
          .from('essays')
          .select(
            'id, essay_category(id, essay_category_name), essay_title, essay_body, created_at, is_submitted',
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
              'id, essay_id(id, essay_category(id)), essay_score, reasons, essay_grade, improvements, created_at')
          .eq('user_id', user.id)
          .eq('essay_id', id)
          .single();

      final essay = EssayResultsModel.fromJson(response);
      return essay;
    } catch (e) {
      return e;
    }
  }
}
