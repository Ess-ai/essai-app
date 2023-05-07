import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mixins/handle_exception_mixin.dart';
import '../mixins/loading_mixin.dart';
import '../models/essay.dart';
import '../pages/app/essay/essay.dart';

class NewEssayController extends GetxController
    with LoadingMixin, HandleExceptions {
  static NewEssayController get instance => Get.find();

  final services = Services();

  final formKey = GlobalKey<FormState>();
  final essayTitle = TextEditingController();
  final essayBody = TextEditingController();

  submitEssay(context, essayCategory) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      EssayModel essay = EssayModel(
        essayCategory: essayCategory,
        essayBody: essayBody.text,
        essayTitle: essayTitle.text,
      );
      var res = await services.essayOperations.addEssay(essay);

      if (res.runtimeType != EssayModel) {
        isLoading(false, context);
        handleExceptions(context, res);
      } else {
        Get.to(Essay(essay: essay));
      }
    }
  }
}
