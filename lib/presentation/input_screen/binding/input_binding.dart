import '../controller/input_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone14PlusFiveScreen.
///
/// This class ensures that the Iphone14PlusFiveController is created when the
/// Iphone14PlusFiveScreen is first loaded.
class InputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputController>(
      () => InputController(),
    );
  }
}
