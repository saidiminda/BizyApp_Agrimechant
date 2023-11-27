import '../../../core/app_export.dart';
import 'listsaidimindas_item_model.dart';

/// This class defines the variables used in the [iphone_14_plus_five_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class InputModel {
  Rx<List<ListsaidimindasItemModel>> listsaidimindasItemList =
      Rx(List.generate(4, (index) => ListsaidimindasItemModel()));
}
