import 'package:flutter/material.dart';
import 'loader.dart';

class SnackMessage {
  final BuildContext context;
  final String state;
  final String? message;
  final Color? color;

  SnackMessage(
      {required this.state, required this.context, this.message, this.color});

  snackMessage() {
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
          backgroundColor: color,
          content: Container(
              color: color,
              padding: const EdgeInsets.all(36),
              child: Text(message!,
                  style: const TextStyle(color: Colors.white)))));
    }
  }
}
