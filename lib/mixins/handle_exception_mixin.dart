import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/app/widgets/snack_message.dart';

mixin HandleExceptions {
  handleExceptions(context, err) {
    if (err.runtimeType == AuthException) {
      ShowErrorMessage.showMessage(
        context,
        ContentType.failure,
        err.message,
        'Authentication Error',
      );
    }

    if (err.runtimeType == PostgrestException) {
      ShowErrorMessage.showMessage(
        context,
        ContentType.failure,
        err.message,
        'Server Error',
      );
    } else {
      ShowErrorMessage.showMessage(
        context,
        ContentType.failure,
        err.runtimeType == Object
            ? 'Connection Error, Please Connect to the Internet'
            : err,
        'Error',
      );
    }
  }
}
