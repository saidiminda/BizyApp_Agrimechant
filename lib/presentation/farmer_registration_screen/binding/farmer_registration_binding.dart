import '../controller/farmer_registration_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FarmerRegistrationScreen.
///
/// This class ensures that the FarmerRegistrationController is created when the
/// FarmerRegistrationScreen is first loaded.
class FarmerRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FarmerRegistrationController());
  }
}
