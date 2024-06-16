import 'package:get/get.dart';

import '../../../data/models/apiModels/laguages_model_model.dart';

class ChangeLanguageController extends GetxController {
   RxList<LaguagesModel> list = <LaguagesModel>[
    LaguagesModel(languageName: "sw".tr, languageCode: "sw", countryCode: "TZ"),
    LaguagesModel(languageName: "eng".tr, languageCode: "en", countryCode: "US")
  ].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
