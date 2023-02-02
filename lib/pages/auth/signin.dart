import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
import 'package:glass/glass.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(children: [
        Expanded(
            flex: 2,
            child: Container(
                child: Stack(children: [
              Container(
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/quest.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(122, 33, 149, 243),
                    Color.fromARGB(122, 68, 137, 255)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              )
            ]))),
        Expanded(
          child: Container(
            color: const Color.fromARGB(122, 0, 0, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
          ).asGlass(),
        ),
      ]),
    );
  }
}
