import 'package:flutter/material.dart';
import 'loader.dart';

class SnackMessage extends StatefulWidget {
  final String state;
  final String? message;
  final Color? color;

  const SnackMessage({Key? key, required this.state, this.message, this.color})
      : super(key: key);

  @override
  SnackMessageState createState() => SnackMessageState();
}

class SnackMessageState extends State<SnackMessage> {
  snackMessage(state, [message, color]) {
    if (state == "Loading") {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 3000),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Container(
          padding: const EdgeInsets.all(36),
          child: const Loader(),
        ),
      ));
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 3000),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Container(
              color: color,
              padding: const EdgeInsets.all(36),
              child:
                  Text(message, style: const TextStyle(color: Colors.white)))));
    }
  }

  @override
  Widget build(BuildContext context) {
    String state = widget.state;
    String? mess = widget.message;
    Color? color = widget.color;
    return snackMessage(state, [mess, color]);
  }
}
