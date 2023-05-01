import 'package:essai/models/airesponse.dart';
import 'package:essai/models/algorithm.dart';
import 'package:essai/models/essay_results.dart';
import 'package:essai/services/add_essay_result.dart';
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
      if (res.runtimeType != AiResposeModel) {
        print(res);
      } else {
        var essayResult = EssayResultsModel(
            essayId: input,
            userId: user.id,
            reasons: res.reasons,
            improvements: res.improvements,
            grade: gradeScore(res.score),
            score: res.score.toString());
        final essres = await AddEssayResult().addEssays(essayResult);
        return essres;
      }
    } on PostgrestException catch (_) {
      print(_.message);
      return _;
    }
  }

  String gradeScore(score) {
    switch (score) {
      case 0:
        {
          return 'F';
        }

      case 1:
        {
          return 'E';
        }

      case 2:
        {
          return 'D';
        }

      case 3:
        {
          return 'B';
        }

      case 4:
        {
          return 'A-';
        }

      case 5:
        {
          return 'A';
        }

      default:
        {
          return "Not Graded";
        }
    }
  }
}
