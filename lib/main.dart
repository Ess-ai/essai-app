import 'package:essai/pages/app/widgets/loader.dart';
import 'package:essai/pages/auth/splash.dart';
import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final service = Services();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service.supabaseService.init();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    service.supabaseService.listentoHeaders();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: LoadingScreen.init(),
      home: Splash(),
    );
  }
}
