import 'package:essai/services/services.dart';
import 'package:get/get.dart';

import '../mixins/handle_exception_mixin.dart';
import '../mixins/loading_mixin.dart';
import '../pages/app/essay/all_essays.dart';

class EssayButtonsController extends GetxController
    with LoadingMixin, HandleExceptions {
  static EssayButtonsController get instance => Get.find();

  final services = Services();

  deleteEssay(context, essay) async {
    var res = await services.essayOperations.deleteEssay(essay);
    isLoading(true, context);
    if (res.runtimeType != String) {
      isLoading(false, context);
      handleExceptions(context, res);
    } else {
      Get.to(const AllEssays());
    }
  }
}
