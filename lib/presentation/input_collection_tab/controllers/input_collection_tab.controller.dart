import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../core/utils/global_fanctions.dart';
import '../../../core/utils/response_handeler.dart';
import '../../../core/utils/show_dialogs.dart';
import '../../../data/databases/shared_preferences_db.dart';
import '../../../data/models/global_modal/profile_response_model.dart';
import '../../login_screen/models/login_response_model.dart';
import '../models/get_farmer_request_model.dart';
import '../models/get_farmer_response_model.dart';
import '../models/member_orders_request_model.dart';
import '../models/request_otp_code_request_model.dart';
import '../models/stock_and_qr_request_model.dart';
import '../models/stock_and_qr_v1_response_model.dart';
import '../providers/get_farmer_request_provider.dart';
// import '../providers/member_orders_request_provider.dart';
import '../providers/request_otp_code_request_provider.dart';
import '../providers/stock_and_qr_request_provider.dart';

class InputCollectionTabController extends GetxController {
  RxList<Importers> importers = <Importers>[].obs;
  Rx<Importers> selectedImporter = Importers().obs;
  RxList<CurrentStock> currentStocks = <CurrentStock>[].obs;
  RxList<Warehouses> warehouses = <Warehouses>[].obs;
  Rx<Warehouses> selectedWarehouse = Warehouses().obs;
  RxList<Order> requirementsList = <Order>[].obs;
  RxList<Order> selectedRequirementsList = <Order>[].obs;
  RxList<String> qrCodesList = <String>[].obs;
  RxBool startScanningQr = false.obs;
  RxBool showSellingArea = false.obs;

  Rx<GetFarmerResponse> getFarmerResponse = GetFarmerResponse().obs;
  RxDouble stdUnitApp = 0.0.obs,
      stdUnitFarmer = 0.0.obs,
      quantityLimit = 0.0.obs,
      itemsReceivedWeight = 0.0.obs;
  RxDouble newOnSaleTotalPrice = 0.0.obs,
      newOnSaleSubsidyAmount = 0.0.obs,
      setOnSaleCashAmount = 0.0.obs;
  RxList<MultiSelectItem<Order>> items = <MultiSelectItem<Order>>[].obs;
  late TextEditingController farmerNumberController,
      farmerNameController,
      farmerVillageController,
      farmSizeController,
      farmPhoneController;
  GlobalKey<FormFieldState> multiSelectKey = GlobalKey<FormFieldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> sellingFormKey = GlobalKey<FormState>();
  Rx<StockAndQrV1Response> stockAndQrV1Response = StockAndQrV1Response().obs;
  Rx<User> user = User().obs;
  RxString deviceid = "".obs;
  RxString applicationVersion = "".obs;
  final famerNamberFormat = RegExp("^[0-9]{11,15}");

  var numberFormat = NumberFormat('#,##0.00', 'sw');
  @override
  void onInit() {
    super.onInit();
    farmerNumberController = TextEditingController();
    farmerNameController = TextEditingController();
    farmerVillageController = TextEditingController();
    farmSizeController = TextEditingController();
    farmPhoneController = TextEditingController();
    getDeviceId();
  }

  @override
  void onReady() {
    super.onReady();
    loadStockAndQr();
  }

  void getDeviceId() async {
    deviceid.value = (await PlatformDeviceId.getDeviceId).toString();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    applicationVersion.value = packageInfo.version;
  }

  void getFarmer(String farmerNumber) async {
    loadingDialog();
    GetFarmerRequest request = GetFarmerRequest(farmerNumber: farmerNumber);
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    if (internetTest) {
      try {
        final response = await GetFarmerRequestProvider()
            .getGetFarmerRequest(request, token);
        if (response.statusCode == 200) {
          Get.back();
          //take data from response to authResponse model
          getFarmerResponse.value =
              GetFarmerResponse.fromJson(jsonDecode(jsonEncode(response.body)));
          farmSizeController.text = getFarmerResponse.value.farmSize.toString();
          farmerNameController.text = getFarmerResponse.value.name.toString();
          stdUnitFarmer.value = getFarmerResponse.value.stdUnitApp!.toDouble();
          farmerVillageController.text =
              getFarmerResponse.value.villageName.toString();
          farmPhoneController.text =
              getFarmerResponse.value.phoneNumber.toString();
          selectedRequirementsList.value = [];
          newOnSaleTotalPrice.value = 0;
          newOnSaleSubsidyAmount.value = 0;
          setOnSaleCashAmount.value = 0;
          startScanningQr.value = false;
          setMultipleSelectionRequirementsList();
          if (getFarmerResponse.value.phoneNumber!.length > 8) {
            showSellingArea.value = true;
          } else {
            showSellingArea.value = false;
            showErrorToast(
                "${getFarmerResponse.value.name} ${"doesntHaveAPhoneNumber".tr}");
          }
        } else {
          Get.back();
          ResponseHandler().responseHandlerOnSinglePage(response);
        }
      } catch (e) {
        Get.back();
        Get.defaultDialog(title: "Exception", middleText: e.toString());
      }
    } else {
      Get.back();
      showErrorToast("noInternet".tr);
    }
  }

  void loadStockAndQr() async {
    loadingDialog();
    ProfileResponse userProfile = await getprofileData();
    user.value = userProfile.profile!;
    final data = {"user_id": user.value.id};
    StockAndQrRequest request = StockAndQrRequest.fromJson(data);
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();

    if (internetTest) {
      try {
        final response = await StockAndQrRequestProvider()
            .getStockAndQrRequest(request, token);
        if (response.statusCode == 200) {
          Get.back();
          //take data from response to authResponse model
          stockAndQrV1Response.value = StockAndQrV1Response.fromJson(
              jsonDecode(jsonEncode(response.body)));
          importers.value = stockAndQrV1Response.value.importers!;
          if (importers.length == 1) {
            selectedImporter.value = importers.first;
            warehouses.value = importers.first.warehouses!;
          }
          if (warehouses.length == 1) {
            selectedWarehouse.value = warehouses.first;
            currentStocks.value = warehouses.first.currentStock!;
          }
          quantityLimit.value =
              stockAndQrV1Response.value.quantityLimit!.toDouble();
          setMultipleSelectionRequirementsList();
        } else {
          ResponseHandler().responseHandlerOnSinglePage(response);
        }
      } catch (e) {
        Get.back();
        Get.defaultDialog(title: "Exception", middleText: e.toString());
      }
    } else {
      Get.back();
      showErrorToast("noInternet".tr);
    }
  }

  void setMultipleSelectionRequirementsList() {
    requirementsList.clear();
    selectedRequirementsList.clear();
    startScanningQr.value = false;
    for (CurrentStock item in currentStocks) {
      if ((item.quantity ?? 0) > 0 && (item.price ?? 0) > 0) {
        Order newItem = Order();
        newItem.item = item.itemId;
        newItem.packageWeight = item.pacakageWeight;
        newItem.itemUnit = item.pacakageWeight;
        newItem.quantity = item.quantity;
        newItem.itemName = item.itemName;
        newItem.stdUnitApp = item.stdUnitApp;
        newItem.price = item.price;
        newItem.subsidyPercentage = item.subsidyPercentage;
        requirementsList.add(newItem);
      }
    }
    items.value = requirementsList
        .map(
            (order) => MultiSelectItem<Order>(order, order.itemName.toString()))
        .toList();
  }

  void calculateFarmerSubsidy(int k, num newQuantity) {
    {
      // num usedfarmSize = getFarmerResponse.value.farmSize!;

      if (selectedRequirementsList.isNotEmpty) {
        num itemsSelectedWeight = 0;
        int checkItems = 0;
        for (Order itemRec in selectedRequirementsList) {
          if (checkItems != k) {
            itemsSelectedWeight = itemsSelectedWeight +
                (itemRec.packageWeight! * itemRec.onSaleItemCount!);
            stdUnitApp.value = itemRec.stdUnitApp!.toDouble() != 0.0
                ? itemRec.stdUnitApp!.toDouble()
                : 100.0;
          }
          checkItems++;
        }
        Order requirement = selectedRequirementsList.elementAt(k);
        num unit = requirement.packageWeight!;
        // num productStock_ = requirement.quantity!;
        stdUnitApp.value = stdUnitFarmer.value != 0.0
            ? stdUnitFarmer.value
            : requirement.stdUnitApp!.toDouble();
        double unitPayedAmount = requirement.subsidyPercentage!.toDouble();
        double originPrice = requirement.price!.toDouble();
        double payedAmount = unitPayedAmount.toDouble();
        double subsidyAmount = originPrice - unitPayedAmount;

        if (unit > 0) {
          // num quantity = usedfarmSize * stdUnitApp.value / unit -
          //     itemsReceivedWeight / unit -
          //     itemsSelectedWeight / unit;
          // num calculatedQuantityLimit = quantityLimit / unit -
          //     itemsReceivedWeight / unit -
          //     itemsSelectedWeight / unit;
          double newTotalPrice = (requirement.price! * newQuantity).toDouble();
          originPrice = (requirement.price! * newQuantity).toDouble();
          payedAmount = (unitPayedAmount * newQuantity).toDouble();
          subsidyAmount = originPrice - payedAmount;

          newOnSaleTotalPrice.value = 0;
          newOnSaleSubsidyAmount.value = 0;
          setOnSaleCashAmount.value = 0;

          selectedRequirementsList.elementAt(k).onSaleItemCount = newQuantity;
          selectedRequirementsList.elementAt(k).onSaleTotalPrice =
              newTotalPrice;
          selectedRequirementsList.elementAt(k).onSaleSubsidyAmount =
              subsidyAmount;
          selectedRequirementsList.elementAt(k).onSaleCashAmount = payedAmount;

          for (Order orderItem in selectedRequirementsList) {
            newOnSaleTotalPrice.value =
                newOnSaleTotalPrice.value + orderItem.onSaleTotalPrice!;
            newOnSaleSubsidyAmount.value =
                newOnSaleSubsidyAmount.value + orderItem.onSaleSubsidyAmount!;
            setOnSaleCashAmount.value =
                setOnSaleCashAmount.value + orderItem.onSaleCashAmount!;
          }
          // if (newQuantity > calculatedQuantityLimit) {
          //   showErrorToast(
          //       "${"quantityExceedLimit".tr} $calculatedQuantityLimit ${"forTheFarmer".tr} ");
          // } else

          if (newQuantity > 200) {
            showErrorToast(
                "${"pleaseNoteThatTheQuantityShouldNotExceedNumber".tr} 200");
          }
          // else if (productStock_ < newQuantity) {
          //   showErrorToast("${"quantityExceedStock".tr} $productStock_");
          // } else if (newQuantity > quantity) {
          //   showErrorToast(
          //       "${"quantityExceedLimit".tr} $quantity ${"forTheFarmer".tr}");
          // }
        }
      }
    }
  }

  void startMakeSellingProduct() {
    num itemsSelectedWeight = 0;
    num orderCount = 0;
    String walletId = getFarmerResponse.value.wallet!;
    int increment = 0;
    for (Order item in selectedRequirementsList) {
      increment = increment + 1;
      itemsSelectedWeight =
          itemsSelectedWeight + (item.packageWeight! * item.onSaleItemCount!);
      stdUnitApp.value =
          item.stdUnitApp != 0 ? item.stdUnitApp!.toDouble() : 100;
      orderCount = orderCount + item.onSaleItemCount!;
      if (item.onSaleItemCount! <= 0) {
        showErrorToast("enterTheQuantityCorrectly".tr);
        return;
      } else if (increment == selectedRequirementsList.length) {
        DateTime calender = DateTime.now();
        int nowYear = calender.year;
        int nowMonth = calender.month;
        int nowDay = calender.day;
        int nowHour = calender.hour;
        int nowMinute = calender.minute;
        String todayDate = "$nowDay/$nowMonth/$nowYear";
        String time = "$nowHour:$nowMinute";

        for (Order order in selectedRequirementsList) {
          order.deliveredCount = order.onSaleItemCount;
          order.userId = user.value.id.toString();
          order.walletId = num.parse(walletId);
          order.memberId = getFarmerResponse.value.memberId;
          order.imeiNumber = deviceid.value;
          order.appVersionName = applicationVersion.value;
          order.date = todayDate;
          order.time = time;
          order.phone = getFarmerResponse.value.phoneNumber;
          order.userableId = user.value.userableId.toString();
          order.importerId = selectedImporter.value.importerId;
          order.warehouseId = selectedWarehouse.value.id;
        }
        if (getFarmerResponse.value.phoneNumber!.length > 8) {
          // requestOtpCode();
          finishDelivery("otpText");
        } else {
          showErrorToast(
              "${getFarmerResponse.value.name} ${"doesntHaveAPhoneNumber".tr}");
        }
      }
    }
  }

  void requestOtpCode() async {
    loadingDialog();
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    if (internetTest) {
      RequestOtpCodeRequest requestOtpRequest = RequestOtpCodeRequest();
      requestOtpRequest.name = getFarmerResponse.value.name;
      requestOtpRequest.phoneNumber = getFarmerResponse.value.phoneNumber;
      requestOtpRequest.memberId = getFarmerResponse.value.memberId.toString();
      requestOtpRequest.entityId = user.value.userableId.toString();
      requestOtpRequest.userId = user.value.id.toString();
      final response = await RequestOtpCodeRequestProvider()
          .postRequestOtpCodeRequest(requestOtpRequest, token);
      if (response.statusCode == 200) {
        Get.back();
        showOtpDialog((String verificationCode) {
          Get.back();
          finishDelivery(verificationCode);
        }, getFarmerResponse.value.phoneNumber!.substring(6));
      } else if (response.statusCode == 401) {
        Get.back();
        logOut();
      } else {
        Get.back();
        ResponseHandler().responseHandlerOnSinglePage(response);
      }
    } else {
      showErrorToast("failed".tr);
    }
  }

  void finishDelivery(String otpText) async {
    loadingDialog();
    bool internetTest = await checkInternetConnection();
    // String token = await getAccessToken();
    if (internetTest) {
      MemberOrdersRequest memberOrdersRequest = MemberOrdersRequest(
          otpCode: otpText,
          phoneNumber: getFarmerResponse.value.phoneNumber,
          memberId: getFarmerResponse.value.memberId.toString(),
          entityId: user.value.userableId.toString(),
          userId: user.value.id.toString(),
          updatedFarmerOrganizations: selectedRequirementsList);
      List<MemberOrdersRequest> memberOrdersRequestList =
          await getMemberOrdersData();
      memberOrdersRequestList.add(memberOrdersRequest);
      setMemberOrdersData(memberOrdersRequestList);
      selectedImporter.value = Importers();
      setMultipleSelectionRequirementsList();
      loadStockAndQr();
      Get.back();
      getFarmer(getFarmerResponse.value.wallet.toString());
      showNoErrorToast("sucessfulSaved".tr);
      // final response = await MemberOrdersRequestProvider()
      //     .postMemberOrdersRequest(memberOrdersRequest, token);
      // if (response.statusCode == 200) {
      //   qrCodesList.clear();
      //   selectedRequirementsList.clear();
      //   selectedImporter.value = Importers();
      //   setMultipleSelectionRequirementsList();
      //   loadStockAndQr();
      //   Get.back();
      //   getFarmer(getFarmerResponse.value.wallet.toString());
      //   showNoErrorToast("sucessfulSaved".tr);
      // } else if (response.statusCode == 401) {
      //   Get.back();
      //   logOut();
      // } else if (response.statusCode == 206) {
      //   Get.back();
      //   ResponseHandler().responseHandlerOnSinglePage(response);
      // } else {
      //   Get.back();
      //   ResponseHandler().responseHandlerOnSinglePage(response);
      // }
    } else {
      Get.back();
      showErrorToast("noInternet".tr);
    }
  }
}
