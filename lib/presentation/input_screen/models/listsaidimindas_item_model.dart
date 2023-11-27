import '../../../core/app_export.dart';

/// This class is used in the [listsaidimindas_item_widget] screen.
class ListsaidimindasItemModel {
  ListsaidimindasItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
