import '../controller/equipment_provider_management_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FarmerManagementScreen.
///
/// This class ensures that the FarmerManagementController is created when the
/// FarmerManagementScreen is first loaded.
class EquipmentProviderManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EquipmentProviderManagementController());
  }
}
