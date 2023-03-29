import 'package:essai/models/algorithm.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/essay.dart';
import 'authentication.dart';
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
          'Imagine you are an English Teacher, Mark this ${input.essayCategory!.essayCategory} essay, Return only the Score. Algorithm: $alg Essay: ${input.essayBody}';
      final res = AiMaker().aiMaker(prompt);
      return res;
    } on PostgrestException catch (_) {
      return _;
    }
  }
}
