import 'package:essai/pages/auth/widgets/left_part.dart';
import 'package:essai/pages/auth/widgets/signup_form.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Row(
          children: [
            const Expanded(child: SignupForm()),
            width <= 840
                ? Container()
                : const Expanded(flex: 2, child: LeftPart())
          ],
        ),
      ),
    );
  }
}
