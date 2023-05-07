import 'package:essai/models/essay.dart';

class Prompts {
  String essayprompt(EssayModel essay, String rubric) {
    String prompt =
        'Mark this ${essay.essayCategory} using this rubric $rubric . Return only score, reasons and improvement areas(improvements) in this example json fomat {"score": 8,"reasons":"","improvements":""}';
    return prompt;
  }
}
