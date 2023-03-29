import 'package:essai/services/aimarker.dart';
import 'package:flutter/material.dart';

class Essai extends StatefulWidget {
  const Essai({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  EssaiState createState() => EssaiState();
}

class EssaiState extends State<Essai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(36),
            child: FutureBuilder(
                future:
                    AiMaker().aiMaker('Give me a plan to come a Billionaire'),
                builder: (context, snapshot) {
                  final grade = snapshot.data;
                  return Text(grade.toString());
                }))
      ]),
    );
  }
}
