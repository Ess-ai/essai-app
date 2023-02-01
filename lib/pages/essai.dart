import 'package:essai/services/aimarker.dart';
import 'package:flutter/material.dart';

class Essai extends StatefulWidget {
  const Essai({Key? key}) : super(key: key);

  @override
  _EssaiState createState() => _EssaiState();
}

class _EssaiState extends State<Essai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(36),
            child: FutureBuilder(
                future:
                    generateResponse('Give me a plan to come a Billionaire'),
                builder: (context, snapshot) {
                  final grade = snapshot.data;
                  return Text(grade.toString());
                }))
      ]),
    );
  }
}
