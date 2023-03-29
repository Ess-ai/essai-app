import 'dart:convert';

import 'package:essai/models/algorithm.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/essay.dart';
import 'aimarker.dart';

final algorithm = EssayMarkingAlgorithm();

class MarkEssay {
  Future markEssay(EssayModel input) async {
    try {
      final String alg = (algorithm.score0 +
          algorithm.score1 +
          algorithm.score3 +
          algorithm.score4 +
          algorithm.score5);
      String prompt =
          'Imagine you are an English Teacher, Mark this ${input.essayCategory!.essayCategory} essay using the score algorithm below, Return score, reasons and improvement areas(improvements) in this example fomat {"score": 8,"reasons":"","improvements":""}: $alg Essay: ${input.essayBody}';
      final res = await AiMaker().aiMaker(prompt);
      print(res);
      return res;
    } on PostgrestException catch (_) {
      return _;
    }
  }
}
