import 'package:essai/pages/app/essay/all_essays.dart';
import 'package:essai/pages/auth/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/secret_loader_controller.dart';
import 'models/secret.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Secret secret = await SecretLoader().load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
