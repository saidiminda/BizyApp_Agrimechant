import '../controller/dashboard_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone14PlusOneTabContainerScreen.
///
/// This class ensures that the Iphone14PlusOneTabContainerController is created when the
/// Iphone14PlusOneTabContainerScreen is first loaded.
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
