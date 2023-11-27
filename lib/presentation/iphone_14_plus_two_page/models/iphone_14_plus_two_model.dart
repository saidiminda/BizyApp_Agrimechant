import '../../../core/app_export.dart';
import 'listsaidimindas3_item_model.dart';

/// This class defines the variables used in the [iphone_14_plus_two_page],
/// and is typically used to hold data that is passed between different parts of the application.
class Iphone14PlusTwoModel {
  Rx<List<Listsaidimindas3ItemModel>> listsaidimindas3ItemList =
      Rx(List.generate(4, (index) => Listsaidimindas3ItemModel()));
}
