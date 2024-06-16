import '../controller/warehouse_management_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FarmerManagementScreen.
///
/// This class ensures that the FarmerManagementController is created when the
/// FarmerManagementScreen is first loaded.
class WarehouseManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WarehouseManagementController());
  }
}
