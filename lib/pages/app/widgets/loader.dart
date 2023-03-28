import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: LoadingAnimationWidget.threeRotatingDots(
            color: Colors.blue.shade900, size: 60));
  }
}
