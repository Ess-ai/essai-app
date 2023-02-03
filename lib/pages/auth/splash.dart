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
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/images/silhouette.jpg'),
                opacity: 0.6,
                fit: BoxFit.cover)),
        child: const Center(
            child: Image(
          image: AssetImage('assets/images/w-essai.png'),
          filterQuality: FilterQuality.high,
        )),
      ),
    );
  }
}
