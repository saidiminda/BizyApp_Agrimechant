import '../controller/equipment_provider_registration_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FarmerRegistrationScreen.
///
/// This class ensures that the FarmerRegistrationController is created when the
/// FarmerRegistrationScreen is first loaded.
class EquipmentProviderRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EquipmentProviderRegistrationController());
  }
}
