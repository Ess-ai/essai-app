import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../navigation/footer.dart';
import '../navigation/header.dart';

class EssayMarking extends StatefulWidget {
  const EssayMarking({Key? key}) : super(key: key);

  @override
  EssayMarkingState createState() => EssayMarkingState();
}

class EssayMarkingState extends State<EssayMarking> {
  String title = 'Plastics Should be banned';
  final bool _isMarking = false;

  Widget body() {
    if (_isMarking) {
      return Column(
        children: [
          Center(child: Lottie.asset('assets/resources/downloading.json')),
          Center(
              child: Text(
            'Your essay is being marked\nYou will get your results Shortly',
            textAlign: TextAlign.center,
            style: GoogleFonts.ptSans(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ],
      );
    } else {
      return const Text('Results');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //Header
          const Header(),

          //Body
          Expanded(
              child: SingleChildScrollView(
                  child: Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(top: 30, left: 200, right: 200),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),

                            //Essay Body
                            body(),

                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),

                            //Footer
                            const Footer(),
                            const SizedBox(
                              height: 10,
                            ),
                          ])))),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
