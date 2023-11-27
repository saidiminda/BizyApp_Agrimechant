import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/presentation/dashboard_tab/models/dashboard_tab_model.dart';

/// A controller class for the Iphone14PlusOnePage.
///
/// This class manages the state of the Iphone14PlusOnePage, including the
/// current iphone14PlusOneModelObj
class DashboardTabController extends GetxController {
  DashboardTabController(this.iphone14PlusOneModelObj);

  Rx<DashboardTabModel> iphone14PlusOneModelObj;
}
