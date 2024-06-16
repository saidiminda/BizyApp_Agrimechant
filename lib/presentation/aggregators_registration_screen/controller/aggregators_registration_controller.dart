import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../service_provider_tab/models/service_provider_tab_model.dart';

/// A controller class for the FarmerRegistrationScreen.
///
/// This class manages the state of the FarmerRegistrationScreen, including the
/// current farmerRegistrationModelObj
class AggregatorsRegistrationController extends GetxController {
  TextEditingController jinaController = TextEditingController();

  TextEditingController baruapepeyaController = TextEditingController();

  TextEditingController jinalaController = TextEditingController();

  TextEditingController nambariyaController = TextEditingController();

  TextEditingController nambariyatinController = TextEditingController();

  TextEditingController majinakamiliController = TextEditingController();

  TextEditingController anwaniController = TextEditingController();

  Rx<ServiceProviderTabModel> iphone14PlusSixModelObj =
      ServiceProviderTabModel().obs;

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

// class DropDown {
//   String? name;
//   String? value;
//   DropDown({this.name, this.value});
// }
