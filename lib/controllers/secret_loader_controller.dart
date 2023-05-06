import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/secret.dart';

class SecretLoader {
  final String secretPath = 'lib/secrets.json';

  SecretLoader();
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(secretPath, (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}
