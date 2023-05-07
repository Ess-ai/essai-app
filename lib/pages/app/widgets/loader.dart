import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../providers/loading_provider.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      child: LoadingAnimationWidget.threeArchedCircle(
        color: Colors.blue.shade900,
        size: 50,
      ),
    );
  }
}

class LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(
          context,
          LoadingOverlay(
            child: child!,
          ),
        );
      } else {
        return LoadingOverlay(child: child!);
      }
    };
  }
}

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  const LoadingOverlay({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider<LoadingProvider>(
        create: (context) => LoadingProvider(),
        builder: (context, _) {
          return Stack(
            children: [
              child,
              Consumer<LoadingProvider>(
                builder: (context, provider, child) {
                  return provider.loading ? const Loading() : Container();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
