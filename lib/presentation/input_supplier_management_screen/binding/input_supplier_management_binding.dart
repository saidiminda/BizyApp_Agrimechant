import '../controller/input_supplier_management_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FarmerManagementScreen.
///
/// This class ensures that the FarmerManagementController is created when the
/// FarmerManagementScreen is first loaded.
class InputSupplierManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputSupplierManagementController());
  }
}
