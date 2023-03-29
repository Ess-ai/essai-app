import 'dart:convert';

import 'package:essai/models/algorithm.dart';
import 'package:essai/models/essay_results.dart';
import 'package:essai/services/add_essay_result.dart';
import 'package:essai/services/get_essays.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/essay.dart';
import 'aimarker.dart';
import 'authentication.dart';

final algorithm = EssayMarkingAlgorithm();

final user = SupabaseAuthentication().session()!.user;
final String alg = (algorithm.score0 +
    algorithm.score1 +
    algorithm.score3 +
    algorithm.score4 +
    algorithm.score5);

class MarkEssay {
  Future markEssay(EssayModel input) async {
    try {
      String prompt =
          'Imagine you are an English Teacher, Mark this ${input.essayCategory!.essayCategory} essay using the score algorithm below, Return score, reasons and improvement areas(improvements) in this example fomat {"score": 8,"reasons":"","improvements":""}: $alg Essay: ${input.essayBody}';
      final res = await AiMaker().aiMaker(prompt);
      var essayResult = EssayResultsModel(
          essayId: input,
          userId: user.id,
          reasons: res.reasons,
          improvements: res.improvements,
          grade: ' ',
          score: res.score.toString());
      final essres = await AddEssayResult().addEssays(essayResult);
      print(essres);
      return essayResult;
    } on PostgrestException catch (_) {
      return _;
    }
  }
}
