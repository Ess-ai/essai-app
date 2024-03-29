import 'dart:convert';
import 'package:essai/models/airesponse.dart';
import 'package:http/http.dart' as http;

import '../../controllers/secret_loader_controller.dart';
import '../../models/secret.dart';

class AiMaker {
  Future aiMaker(String prompt) async {
    Secret secret = await SecretLoader().load();
    try {
      var url = Uri.https("api.openai.com", "/v1/completions");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${secret.openaiApiKey}"
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
      );

      // Do something with the response
      Map<String, dynamic> res = jsonDecode(response.body);
      final aires = AiResposeModel.fromJson(
          jsonDecode(res['choices'][0]['text']) as Map<String, dynamic>);
      return aires;
    } catch (e) {
      return e;
    }
  }
}
