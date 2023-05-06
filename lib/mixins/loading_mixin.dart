import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/loading_provider.dart';

mixin LoadingMixin {
  isLoading(bool display, BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoadingProvider>().setLoad(display);
    });
  }
}
