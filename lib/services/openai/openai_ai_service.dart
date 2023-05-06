import 'package:essai/models/user.dart';
import 'package:essai/services/openai/aimarker.dart';
import 'package:essai/services/supabase/supabase_essay_operations.dart';

import '../../models/airesponse.dart';
import '../../models/essay.dart';
import '../../models/essay_results.dart';
import '../../repositories/ai_marking_repository.dart';
import '../prompts.dart';

class OpenAiService implements AiRepository {
  final marker = AiMaker();
  final prompts = Prompts();
  final essayOperations = SupabaseEssayServices();
  final UserModel user = UserModel(id: 'id', userName: 'userName');

  @override
  Future markEssay(EssayModel essay, String rubric) async {
    try {
      final res = await marker.aiMaker(prompts.essayprompt(essay, rubric));
      if (res.runtimeType != AiResposeModel) {
        var essayResult = EssayResultsModel(
          essayId: essay,
          userId: user.id,
          reasons: res.reasons,
          improvements: res.improvements,
          score: res.score.toString(),
        );
        final essres = await essayOperations.addEssaiResult(essayResult);
        return essres;
      } else {}
    } catch (e) {
      return e;
    }
  }
}
