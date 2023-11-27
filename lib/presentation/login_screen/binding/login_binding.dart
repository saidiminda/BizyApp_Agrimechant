import '../controller/login_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone14PlusEightScreen.
///
/// This class ensures that the Iphone14PlusEightController is created when the
/// Iphone14PlusEightScreen is first loaded.
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
