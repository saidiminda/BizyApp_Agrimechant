import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/presentation/dashboard_screen/models/dashboard_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the Iphone14PlusOneTabContainerScreen.
///
/// This class manages the state of the Iphone14PlusOneTabContainerScreen, including the
/// current iphone14PlusOneTabContainerModelObj
class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<DashboardModel> iphone14PlusOneTabContainerModelObj = DashboardModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));
}
