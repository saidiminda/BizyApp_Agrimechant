import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/presentation/service_provider_tab/models/service_provider_tab_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the Iphone14PlusSixPage.
///
/// This class manages the state of the Iphone14PlusSixPage, including the
/// current iphone14PlusSixModelObj
class ServiceProviderTabController extends GetxController {
  ServiceProviderTabController(this.iphone14PlusSixModelObj);

  TextEditingController jinaController = TextEditingController();

  TextEditingController baruapepeyaController = TextEditingController();

  TextEditingController jinalaController = TextEditingController();

  TextEditingController nambariyaController = TextEditingController();

  TextEditingController nambariyatinController = TextEditingController();

  TextEditingController majinakamiliController = TextEditingController();

  TextEditingController anwaniController = TextEditingController();

  Rx<ServiceProviderTabModel> iphone14PlusSixModelObj;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  @override
  void onClose() {
    super.onClose();
    jinaController.dispose();
    baruapepeyaController.dispose();
    jinalaController.dispose();
    nambariyaController.dispose();
    nambariyatinController.dispose();
    majinakamiliController.dispose();
    anwaniController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in iphone14PlusSixModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    iphone14PlusSixModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in iphone14PlusSixModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    iphone14PlusSixModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in iphone14PlusSixModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    iphone14PlusSixModelObj.value.dropdownItemList2.refresh();
  }

  onSelected3(dynamic value) {
    for (var element in iphone14PlusSixModelObj.value.dropdownItemList3.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    iphone14PlusSixModelObj.value.dropdownItemList3.refresh();
  }
}
