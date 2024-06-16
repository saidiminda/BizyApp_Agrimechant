import 'package:get/get.dart';

import '../controllers/change_language.controller.dart';

class ChangeLanguageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeLanguageController>(
      () => ChangeLanguageController(),
    );
  }
}
