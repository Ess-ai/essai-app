import 'package:essai/models/secret.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Future<void> init() async {
    await dotenv.load(fileName: ".env", mergeWith: {
      'TEST_VAR': '5',
    });
  }
}
