import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/data/databases/shared_preferences_db.dart';
// import 'package:saidi_s_application3/presentation/iphone_14_plus_two_page/models/iphone_14_plus_two_model.dart';

import '../../input_collection_tab/models/member_orders_request_model.dart';

/// A controller class for the Iphone14PlusTwoPage.
///
/// This class manages the state of the Iphone14PlusTwoPage, including the
/// current iphone14PlusTwoModelObj
class Iphone14PlusTwoController extends GetxController {

   RxList<MemberOrdersRequest> listsaidimindas3ItemList = <MemberOrdersRequest>[].obs;

  @override
  void onInit() async{
    super.onInit();
    listsaidimindas3ItemList.value = await getMemberOrdersData();
  }
}
