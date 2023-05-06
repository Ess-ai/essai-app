library essay;

import '../models/essay.dart';
import '../models/essay_results.dart';

abstract class EssayRepository {
  Future getEssays();
  Future getEssay(String id);
  Future getEssayResults(String id);
}

abstract class EssayOperationsRepository {
  Future addEssay(EssayModel essay);
  Future addEssaiResult(EssayResultsModel essay);
  Future submitEssay(EssayModel essay);
  Future editEssay(EssayModel essay);
  Future deleteEssay(EssayModel essay);
}
