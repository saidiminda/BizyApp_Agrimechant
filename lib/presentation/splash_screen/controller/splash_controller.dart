import 'package:saidi_s_application3/core/app_export.dart';

import '../../../data/databases/shared_preferences_db.dart';

/// A controller class for the Iphone14PlusSevenScreen.
///
/// This class manages the state of the Iphone14PlusSevenScreen, including the
/// current iphone14PlusSevenModelObj
class SplashController extends GetxController {
  RxString token = "".obs;

  @override
  void onReady() async {
    token.value = "";
    token.value = await getAccessToken();
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (token.value.isNotEmpty) {
        Get.offAllNamed(AppRoutes.questionnaireDashboardScreen);
      } else {
        Get.offAllNamed(AppRoutes.loginScreen);
      }
    });
  }
}
