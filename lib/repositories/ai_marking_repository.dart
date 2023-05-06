library ai_repository;

import 'package:essai/models/essay.dart';

abstract class AiRepository {
  Future markEssay(EssayModel essai, String rubric);
}
