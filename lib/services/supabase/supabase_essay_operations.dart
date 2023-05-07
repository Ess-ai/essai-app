import 'package:essai/models/essay.dart';
import 'package:essai/repositories/essay_repository.dart';
import 'package:essai/services/storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/essay_results.dart';
import '../../models/user.dart';

class EssayOperations implements EssayOperationsRepository {
  final usr = Storage().storage.getItem('user');

  @override
  Future addEssay(EssayModel essay) async {
    final user = UserModel.fromJson(usr);
    try {
      final response = await Supabase.instance.client.from('essays').insert({
        'user_id': user.id,
        'essay_category': essay.essayCategory,
        'essay_title': essay.essayTitle,
        'essay_body': essay.essayBody,
        'is_submitted': essay.isSubmitted
      }).select();

      //final essays = EssayModel.fromJson(response);
      return response;
    } catch (e) {
      return e;
    }
  }

  @override
  Future deleteEssay(EssayModel essay) async {
    final user = UserModel.fromJson(usr);
    try {
      await Supabase.instance.client
          .from('essays')
          .delete()
          .eq('id', essay.id)
          .eq('user_id', user.id);

      return 'Essay Deleted';
    } catch (e) {
      return e;
    }
  }

  @override
  Future editEssay(EssayModel essay) async {
    final user = UserModel.fromJson(usr);
    try {
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
    } catch (e) {
      return;
    }
  }

  @override
  Future submitEssay(EssayModel essay) {
    throw UnimplementedError();
  }

  @override
  Future addEssaiResult(EssayResultsModel essay) async {
    final user = UserModel.fromJson(usr);
    try {
      final response = await Supabase.instance.client.rpc(
        'create_marked_essay',
        params: {
          'p_user_id': user.id,
          'p_essay_id': essay.essayId!.id,
          'p_score': essay.score,
          'p_reasons': essay.reasons,
          'p_improvements': essay.improvements,
          'p_grade': essay.grade,
        },
      ).select();

      //final essays = EssayModel.fromJson(response);
      return response;
    } catch (e) {
      return e;
    }
  }
}
