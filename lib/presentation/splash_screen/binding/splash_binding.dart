import '../controller/splash_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone14PlusSevenScreen.
///
/// This class ensures that the Iphone14PlusSevenController is created when the
/// Iphone14PlusSevenScreen is first loaded.
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
