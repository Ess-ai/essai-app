import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvInit {
  Future<void> init() async {
    await dotenv.load(fileName: ".env", mergeWith: {
      'TEST_VAR': '5',
    });
  }
}
