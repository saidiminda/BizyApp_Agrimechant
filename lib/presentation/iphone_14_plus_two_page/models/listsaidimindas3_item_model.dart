import '../../../core/app_export.dart';

/// This class is used in the [listsaidimindas3_item_widget] screen.
class Listsaidimindas3ItemModel {
  Listsaidimindas3ItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
