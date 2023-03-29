import 'dart:convert';
import 'package:essai/constants.dart';
import 'package:essai/models/airesponse.dart';
import 'package:http/http.dart' as http;

class AiMaker {
  Future aiMaker(String prompt) async {
    final apiKey = AppConstants().openaiApiKey;
    try {
      var url = Uri.https("api.openai.com", "/v1/completions");
      /*final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $apiKey"
        },
        body: json.encode({
          "model": "text-davinci-003",
          "prompt": prompt,
          'temperature': 0,
          'max_tokens': 2000,
          'top_p': 1,
          'frequency_penalty': 0.0,
          'presence_penalty': 0.0,
        }),
      );*/

      // Do something with the response

      final Map<String, dynamic> response = await jsonDecode(
          '{"score": 4,"reasons":"Addresses the topic and task using somewhat developed explanations, exemplifications and/or details, Displays unity, progression and coherence, though connection of ideas may be occasionally obscured, May demonstrate inconsistent facility in sentence formation and word choice that may result in lack of clarity and occasionally obscure meaning","improvements":"Improve sentence formation and word choice to ensure clarity and meaning, Elaborate on explanations, exemplifications and/or details to provide more depth to the essay"}');
      final res = AiResposeModel.fromJson(response);
      return res;
    } catch (e) {
      return e;
    }
  }
}
