import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:essai/controllers/splash_controller.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashController.loadScreen();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: Text(
          'Essai',
          style: TextStyle(
              color: Colors.blue.shade900, fontSize: 48, fontFamily: 'Blanka'),
        )),
      ),
    );
  }
}
