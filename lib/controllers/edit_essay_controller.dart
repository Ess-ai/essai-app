import 'package:essai/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mixins/handle_exception_mixin.dart';
import '../mixins/loading_mixin.dart';
import '../models/essay.dart';
import '../pages/app/essay/essay.dart';

class EditEssayController extends GetxController
    with LoadingMixin, HandleExceptions {
  static EditEssayController get instance => Get.find();

  final services = Services();

  final formKey = GlobalKey<FormState>();
  final essayCategory = TextEditingController();
  final essayTitle = TextEditingController();
  final essayBody = TextEditingController();

  saveEssay(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      EssayModel essay = EssayModel(
        essayCategory: essayCategory.value.text,
        essayBody: essayBody.text,
        essayTitle: essayTitle.text,
      );
      var res = await services.essayOperations.editEssay(essay);

      if (res.runtimeType != EssayModel) {
        isLoading(false, context);
        handleExceptions(context, res);
      } else {
        Get.to(Essay(essay: essay));
      }
    }
  }

  submitEssay(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      EssayModel essay = EssayModel(
        essayCategory: essayCategory.value.text,
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

  deleteEssay(context, essay) async {
    var res = await services.essayOperations.deleteEssay(essay);
    isLoading(true, context);
    if (res.runtimeType != String) {
      isLoading(false, context);
      handleExceptions(context, res);
    } else {
      Get.back();
    }
  }
}
