import 'package:flutter/material.dart';
import 'package:saidi_s_application3/core/app_export.dart';
// import 'package:saidi_s_application3/presentation/input_screen/models/input_model.dart';

import '../../../data/databases/shared_preferences_db.dart';
import '../../input_collection_tab/models/member_orders_request_model.dart';

/// A controller class for the Iphone14PlusFiveScreen.
///
/// This class manages the state of the Iphone14PlusFiveScreen, including the
/// current iphone14PlusFiveModelObj
class InputController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList<MemberOrdersRequest> iphone14PlusFiveModelObj =
      <MemberOrdersRequest>[].obs;
  RxBool ussdOrder = false.obs;
  RxBool appOrder = false.obs;
  RxBool filterByDate = false.obs;
  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));
  @override
  void onInit() async {
    super.onInit();
    iphone14PlusFiveModelObj.value = await getMemberOrdersData();
  }
}
