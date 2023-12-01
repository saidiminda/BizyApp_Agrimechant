import 'package:saidi_s_application3/presentation/input_collection_tab/models/member_orders_request_model.dart';

import '../../../core/app_export.dart';

/// This class defines the variables used in the [iphone_14_plus_two_page],
/// and is typically used to hold data that is passed between different parts of the application.
class Iphone14PlusTwoModel {
  Rx<List<MemberOrdersRequest>> listsaidimindas3ItemList =
      Rx(List.generate(4, (index) => MemberOrdersRequest()));
}
