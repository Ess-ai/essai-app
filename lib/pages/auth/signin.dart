import 'package:essai/pages/auth/widgets/left_part.dart';
import 'package:essai/pages/auth/widgets/signin_form.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Row(
          children: [
            width <= 840
                ? Container()
                : const Expanded(flex: 2, child: LeftPart()),
            const Expanded(child: SigninForm()),
          ],
        ),
      ),
    );
  }
}
