import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EssayMarking extends StatefulWidget {
  const EssayMarking({Key? key}) : super(key: key);

  @override
  EssayMarkingState createState() => EssayMarkingState();
}

class EssayMarkingState extends State<EssayMarking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Center(
            child: Lottie.asset('assets/resources/downloading.json'),
          )
        ]));
  }
}
