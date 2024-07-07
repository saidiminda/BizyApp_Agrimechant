import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../core/utils/functions/global.dart';
import '../../../core/utils/functions/response_handeler.dart';
import '../../../core/utils/functions/show_dialogs.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/databases/shared_preferences_db.dart';
import '../../../data/models/apiModels/dropdowns_response_model.dart';
import '../../../data/models/apiModels/initial_data_response_model.dart';
import '../../../data/models/apiModels/profile_response_model.dart';
import '../../../data/models/apiModels/register_farmer_request_model.dart';
import '../../../data/models/apiModels/single_farmer_response_model.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

/// A controller class for the FarmerRegistrationScreen.
///
/// This class manages the state of the FarmerRegistrationScreen, including the
/// current farmerRegistrationModelObj
class FarmerRegistrationController extends GetxController {
  //start
  String regType = Get.arguments["type"];
  Farmers? offlineFarmer = Get.arguments["farmer"];
  Rx<RegisterFarmerRequest> localRegisterFarmerRequest =
      RegisterFarmerRequest(farmers: []).obs;
  Rx<ProfileResponse> userProfile = ProfileResponse().obs;
  Rx<InitialDataResponse> dashboardResponse = InitialDataResponse().obs;
  GlobalKey<FormState> step0FormKey = GlobalKey<FormState>();
  GlobalKey<FormState> step1FormKey = GlobalKey<FormState>();
  GlobalKey<FormState> step2FormKey = GlobalKey<FormState>();
  Rx<FingerPrintData> fingerPrintData = FingerPrintData().obs;
  RxList<FarmInfo> farmInfos = <FarmInfo>[].obs;
  Rx<Farmers> currentFarmer =
      Farmers(data: Data(generalInfo: GeneralInfo())).obs;
  RxBool edit = false.obs;
  RxInt currentStep = 0.obs;

  late TextEditingController farmerNumberController,
      farmerPhoneController,
      farmerNameController,
      contactPersonNameController,
      contactPersonPhoneController,
      farmerIdController,
      dateController;
  final famerNamberFormat = RegExp("^[0-9]{11,15}");
  RxString identityNumberRegex =
      "^[0-9]{8}[-]?[0-9]{5}[-]?[0-9]{5}[-]?[0-9]{2,3}".obs;

  RxList<Ward> wards = <Ward>[].obs;
  List<SelectionPopupModel> genderList = [
    SelectionPopupModel(title: "Male", value: "Male"),
    SelectionPopupModel(title: "Female", value: "Female")
  ];
  List<SelectionPopupModel> institutionTypeList = [
    SelectionPopupModel(title: "Serikali", value: "GOV"),
    SelectionPopupModel(title: "Chama kikuu", value: "UNION"),
    SelectionPopupModel(title: "Chama cha msingi", value: "AMCOS"),
    SelectionPopupModel(
        title: "Ushilika wa wakulima", value: "COMMERCIAL FARMERS"),
    SelectionPopupModel(title: "Siyo ya kiserikali (NGOs)", value: "NGOs")
  ];
  List<SelectionPopupModel> groupMembershipList = [
    SelectionPopupModel(title: "Mwanachama", value: "Member"),
    SelectionPopupModel(title: "Sio mwanachama", value: "Non Member")
  ];
  List<SelectionPopupModel> registrationTypeList = [
    SelectionPopupModel(title: "Mtu binafsi", value: "INDIVIDUAL"),
    SelectionPopupModel(title: "Taasisi", value: "INSTITUTION")
  ];
  // RxList<MultiSelectItem<Villages>> areaOfOperationList =
  //     <MultiSelectItem<Villages>>[].obs;
  List<SelectionPopupModel> ownershipList = [
    SelectionPopupModel(title: "owned".tr, value: "Owned"),
    SelectionPopupModel(title: "lease".tr, value: "Leased"),
    SelectionPopupModel(title: "family".tr, value: "Family"),
    SelectionPopupModel(title: "group".tr, value: "Group")
  ];
  Rx<SelectionPopupModel> selectedGender = SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedInstitutionType =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedMembership =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedRegistrationType =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedVillage = SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedGroup = SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedIdentity = SelectionPopupModel(title: "").obs;
  RxList<SelectionPopupModel> villagesDropdownList =
      <SelectionPopupModel>[].obs;
  RxList<SelectionPopupModel> groupsDropdownList = <SelectionPopupModel>[].obs;
  RxList<SelectionPopupModel> identitysDropdownList =
      <SelectionPopupModel>[].obs;
  // RxList<CommunitySeedBanks> selecetedCommunitySeedBanks =
  //     <CommunitySeedBanks>[].obs;
  Rx<bool> ownSmartPhone = false.obs;
  RxString image = "".obs;

  RxString deviceid = "".obs;
  RxString applicationVersion = "".obs;
  takeImage() async {
    var tempImage = await ImagePicker().pickImage(
            source: ImageSource.camera,
            maxHeight: 265,
            maxWidth: 265,
            imageQuality: 100) ??
        XFile("");
    final FaceDetector faceDetector = FaceDetector(
      options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate),
    );
    List<Face> faces = await faceDetector
        .processImage(InputImage.fromFilePath(tempImage.path));
    if (faces.length == 1) {
      image.value = base64Encode(await tempImage.readAsBytes());
    } else {
      showErrorToast("Chukua picha kwa usahihi".tr);
    }
  }
  //end

  @override
  void onInit() {
    super.onInit();
    farmerNumberController = TextEditingController();
    farmerPhoneController = TextEditingController();
    dateController = TextEditingController();
    farmerNameController = TextEditingController();
    farmerIdController = TextEditingController();
    contactPersonNameController = TextEditingController();
    contactPersonPhoneController = TextEditingController();
    getDashoardDataOnline();
    getFarmerOffline(offlineFarmer);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getDashoardDataOnline() async {
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    userProfile.value = await getprofileData();
    setDropdownsLists();
    if (internetTest) {
      final response = await ApiClient()
          .getDashboardResponse(userProfile.value.profile!.id, token);
      if (response.statusCode == 200) {
        if (response.body != null) {
          dashboardResponse.value = InitialDataResponse.fromJson(
              jsonDecode(jsonEncode(response.body)));
          setDropdownsLists();
          setDashboardData(dashboardResponse.value);
        }
      } else if (response.statusCode == 401) {
        logOut();
      } else {
        ResponseHandler().responseHandlerOnSinglePage(response);
      }
    }
  }

  void registerFarmer() async {
    loadingDialog();
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    DateTime calender = DateTime.now();
    int nowYear = calender.year;
    int nowMonth = calender.month;
    int nowDay = calender.day;
    int nowHour = calender.hour;
    int nowMinute = calender.minute;
    String todayDate = "$nowDay/$nowMonth/$nowYear";
    String time = "$nowHour:$nowMinute";
    currentFarmer = Farmers(data: Data(generalInfo: GeneralInfo())).obs;
    currentFarmer.value.id ??= 0;
    currentFarmer.value.editingStatus = 1;
    currentFarmer.value.userId = userProfile.value.profile!.id;
    currentFarmer.value.data!.generalInfo!.villageId = selectedVillage.value.id;
    currentFarmer.value.data!.generalInfo!.name = farmerNameController.text;
    currentFarmer.value.data!.generalInfo!.farmerGroupId =
        selectedGroup.value.id;
    currentFarmer.value.data!.generalInfo!.gender = selectedGender.value.value;
    currentFarmer.value.data!.generalInfo!.ownsSmartPhone =
        ownSmartPhone.value ? 1 : 0;
    currentFarmer.value.data!.generalInfo!.communitySeedBankIds =
        // selecetedCommunitySeedBanks.map((element) => element.id!).toList();
    currentFarmer.value.data!.generalInfo!.farmerType =
        selectedRegistrationType.value.value;
    currentFarmer.value.data!.generalInfo!.phoneNumber =
        farmerPhoneController.text;
    currentFarmer.value.data!.generalInfo!.dateOfBirth = dateController.text;
    currentFarmer.value.data!.generalInfo!.identityType =
        selectedIdentity.value.title;
    currentFarmer.value.data!.generalInfo!.isMember =
        selectedMembership.value.value;
    currentFarmer.value.data!.generalInfo!.registrationType =
        selectedRegistrationType.value.value;
    currentFarmer.value.data!.generalInfo!.contactPersonName =
        contactPersonNameController.text;
    currentFarmer.value.data!.generalInfo!.contactPersonName =
        contactPersonPhoneController.text;
    currentFarmer.value.data!.generalInfo!.institutionType =
        selectedInstitutionType.value.value;
    if (fingerPrintData.value.finger1 != null) {
      currentFarmer.value.data!.generalInfo!.fingerPrintData =
          fingerPrintData.value;
    }
    currentFarmer.value.data!.generalInfo!.identityNumber =
        farmerIdController.text;
    currentFarmer.value.data!.farmInfo = List.from(farmInfos);
    currentFarmer.value.data!.image = FarmerImage(image: image.value);

    RegisterFarmerRequest registerfarmerrequest = RegisterFarmerRequest(
        imeiNumber: deviceid.value,
        appVersionName: applicationVersion.value,
        date: todayDate,
        time: time,
        farmers: [currentFarmer.value]);

    if (internetTest) {
      final response = await ApiClient()
          .postRegisterFarmerRequest(registerfarmerrequest, token);
      if (response.statusCode == 200) {
        if ((response.body["code"] ?? 0) == 1) {
          farmerNumberController.text = "";
          farmerNameController.text = "";
          selectedGender.value = SelectionPopupModel(title: "");
          selectedMembership.value = SelectionPopupModel(title: "");
          selectedRegistrationType.value = SelectionPopupModel(title: "");
          selectedGroup.value = SelectionPopupModel(title: "");
          selectedVillage.value = SelectionPopupModel(title: "");
          selectedIdentity.value = SelectionPopupModel(title: "");
          // selecetedCommunitySeedBanks.value = [];
          ownSmartPhone.value = false;
          farmerPhoneController.text = "";
          dateController.text = "";
          farmerIdController.text = "";
          contactPersonNameController.text = "";
          contactPersonPhoneController.text = "";
          edit.value = false;
          image.value = "";
          farmInfos.clear();
          currentStep.value = 0;
          Get.back();
          showNoErrorToast("successfully".tr);
          List<Farmers> presentFarmer =
              (localRegisterFarmerRequest.value.farmers ?? [])
                  .where((p0) =>
                      (p0.data!.generalInfo!.wallet ==
                          farmerNumberController.text) ||
                      (p0.data!.generalInfo!.id == currentFarmer.value.id))
                  .toList();
          if (presentFarmer.isNotEmpty) {
            for (var element in presentFarmer) {
              localRegisterFarmerRequest.value.farmers!.remove(element);
            }
            setFarmerLocalData(localRegisterFarmerRequest.value);
          }
        } else {
          Get.back();
          showCastomDialog(response.body.toString(), Colors.red);
        }
      } else if (response.statusCode == 401) {
        logOut();
      } else {
        Get.back();
        ResponseHandler().responseHandlerOnSinglePage(response);
      }
    } else {
      localRegisterFarmerRequest.value.farmers ??= [];
      localRegisterFarmerRequest.value.lastFarmerIndex ??= 0;
      Farmers farmer = currentFarmer.value;
      farmer.registrationStatus ??= regType;
      farmer.editingStatus = 1;
      if (farmer.id! < 1) {
        localRegisterFarmerRequest.value.lastFarmerIndex =
            localRegisterFarmerRequest.value.lastFarmerIndex! + 1;
        farmer.id = localRegisterFarmerRequest.value.lastFarmerIndex;
      }

      farmer.data!.generalInfo!.wallet ??= farmerNumberController.text;
      List<Farmers> presentFarmer =
          (localRegisterFarmerRequest.value.farmers ?? [])
              .where((p0) => (((p0.data!.generalInfo!.wallet ==
                          farmer.data!.generalInfo!.wallet) &&
                      p0.data!.generalInfo!.wallet != null) ||
                  (p0.id == farmer.id) ||
                  ((p0.data!.generalInfo!.id == farmer.data!.generalInfo!.id) &&
                      farmer.data!.generalInfo!.id != null)))
              .toList();
      if (presentFarmer.isNotEmpty) {
        for (var element in presentFarmer) {
          localRegisterFarmerRequest.value.farmers!.remove(element);
        }
        localRegisterFarmerRequest.value.farmers!.add(farmer);
        setFarmerLocalData(localRegisterFarmerRequest.value);
      } else {
        localRegisterFarmerRequest.value.farmers!.add(farmer);
        setFarmerLocalData(localRegisterFarmerRequest.value);
      }

      localRegisterFarmerRequest.refresh();

      farmerNumberController.text = "";
      farmerNameController.text = "";
      selectedGender.value = SelectionPopupModel(title: "");
      selectedMembership.value = SelectionPopupModel(title: "");
      selectedRegistrationType.value = SelectionPopupModel(title: "");
      selectedGroup.value = SelectionPopupModel(title: "");
      selectedVillage.value = SelectionPopupModel(title: "");
      selectedIdentity.value = SelectionPopupModel(title: "");
      farmerPhoneController.text = "";
      dateController.text = "";
      farmerIdController.text = "";
      contactPersonNameController.text = "";
      contactPersonPhoneController.text = "";
      edit.value = false;
      image.value = "";
      farmInfos.clear();
      currentStep.value = 0;
      Get.back();
      showCastomDialog(
          "Taarifa zimehifadhiwa kwenye simu, Nje ya mtandao", Colors.green);
    }
  }

  void getFarmer(String farmerNumber) async {
    edit.value = false;
    loadingDialog();
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    if (internetTest) {
      try {
        final response =
            await ApiClient().getSingleFarmerResponse(farmerNumber, token);
        if (response.statusCode == 200) {
          Get.back();
          edit.value = true;
          //take data from response to authResponse model
          SingleFarmerResponse singleFarmerResponse =
              SingleFarmerResponse.fromJson(
                  jsonDecode(jsonEncode(response.body)));
          currentFarmer.value = singleFarmerResponse.farmer != null
              ? singleFarmerResponse.farmer!
              : Farmers();
          farmerNameController.text = currentFarmer.value.data != null
              ? currentFarmer.value.data!.generalInfo != null
                  ? currentFarmer.value.data!.generalInfo!.name ?? ""
                  : ""
              : "";
          for (SelectionPopupModel gender in genderList) {
            if (gender.value!.toLowerCase() ==
                (currentFarmer.value.data != null
                    ? currentFarmer.value.data!.generalInfo != null
                        ? currentFarmer.value.data!.generalInfo!.gender
                            .toString()
                            .toLowerCase()
                        : ""
                    : "")) {
              selectedGender.value = gender;
            }
          }
          setDropdownsLists();
          selectedVillage.value = villagesDropdownList.firstWhere(
            (element) =>
                element.id ==
                (currentFarmer.value.data != null
                    ? currentFarmer.value.data!.generalInfo != null
                        ? currentFarmer.value.data!.generalInfo!.villageId
                        : ""
                    : ""),
            orElse: () => SelectionPopupModel(title: ""),
          );
          selectedGroup.value = groupsDropdownList.firstWhere(
            (element) =>
                element.id ==
                (currentFarmer.value.data != null
                    ? currentFarmer.value.data!.generalInfo != null
                        ? currentFarmer.value.data!.generalInfo!.farmerGroupId
                        : ""
                    : ""),
            orElse: () => SelectionPopupModel(title: ""),
          );

          selectedIdentity.value = identitysDropdownList.firstWhere(
            (element) =>
                element.title ==
                (currentFarmer.value.data != null
                    ? currentFarmer.value.data!.generalInfo != null
                        ? currentFarmer.value.data!.generalInfo!.identityType
                        : ""
                    : ""),
            orElse: () => SelectionPopupModel(title: ""),
          );
          farmerPhoneController.text = currentFarmer.value.data != null
              ? currentFarmer.value.data!.generalInfo != null
                  ? currentFarmer.value.data!.generalInfo!.phoneNumber ?? ""
                  : ""
              : "";
          dateController.text = currentFarmer.value.data != null
              ? currentFarmer.value.data!.generalInfo != null
                  ? currentFarmer.value.data!.generalInfo!.dateOfBirth ?? ""
                  : ""
              : "";
          farmerIdController.text = currentFarmer.value.data != null
              ? currentFarmer.value.data!.generalInfo != null
                  ? currentFarmer.value.data!.generalInfo!.identityNumber ?? ""
                  : ""
              : "";
          contactPersonNameController.text = currentFarmer.value.data != null
              ? currentFarmer.value.data!.generalInfo != null
                  ? currentFarmer.value.data!.generalInfo!.contactPersonName ??
                      ""
                  : ""
              : "";
          contactPersonPhoneController.text = currentFarmer.value.data != null
              ? currentFarmer.value.data!.generalInfo != null
                  ? currentFarmer
                          .value.data!.generalInfo!.contactPersonPhoneNumber ??
                      ""
                  : ""
              : "";
          selectedMembership.value = groupMembershipList.firstWhere(
            (element) =>
                element.value ==
                (currentFarmer.value.data != null
                    ? currentFarmer.value.data!.generalInfo != null
                        ? currentFarmer.value.data!.generalInfo!.isMember
                        : ""
                    : ""),
            orElse: () => SelectionPopupModel(title: ""),
          );
          selectedInstitutionType.value = institutionTypeList.firstWhere(
            (element) =>
                element.value ==
                (currentFarmer.value.data != null
                    ? currentFarmer.value.data!.generalInfo != null
                        ? currentFarmer.value.data!.generalInfo!.institutionType
                            .toString()
                            .toUpperCase()
                        : ""
                    : ""),
            orElse: () => SelectionPopupModel(title: ""),
          );
          selectedRegistrationType.value = registrationTypeList.firstWhere(
            (element) =>
                element.value ==
                (currentFarmer.value.data != null
                    ? currentFarmer.value.data!.generalInfo != null
                        ? currentFarmer
                            .value.data!.generalInfo!.registrationType
                            .toString()
                            .toUpperCase()
                        : ""
                    : ""),
            orElse: () => SelectionPopupModel(title: ""),
          );

          farmInfos.value = currentFarmer.value.data != null
              ? currentFarmer.value.data!.farmInfo != null
                  ? currentFarmer.value.data!.farmInfo ?? []
                  : []
              : [];
          image.value = currentFarmer.value.data != null
              ? currentFarmer.value.data!.image != null
                  ? ((currentFarmer.value.data!.image!.image ?? "")
                                      .replaceAll(RegExp(r'\s+'), ''))
                                  .length %
                              4 ==
                          0
                      ? (currentFarmer.value.data!.image!.image ?? "")
                      : ""
                  : ""
              : "";
          fingerPrintData.value = currentFarmer.value.data != null
              ? currentFarmer.value.data!.generalInfo != null
                  ? currentFarmer.value.data!.generalInfo!.fingerPrintData ??
                      FingerPrintData()
                  : FingerPrintData()
              : FingerPrintData();
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
      Get.defaultDialog(
          title: "Sorry", middleText: "Check internet connection");
    }
  }

  void getFarmerOffline(Farmers? farmer) async {
    if (farmer != null) {
      edit.value = true;
      currentFarmer.value = farmer;
      farmerNumberController.text = currentFarmer.value.data != null
          ? currentFarmer.value.data!.generalInfo != null
              ? currentFarmer.value.data!.generalInfo!.wallet.toString()
              : ""
          : "";
      farmerNameController.text = currentFarmer.value.data != null
          ? currentFarmer.value.data!.generalInfo != null
              ? currentFarmer.value.data!.generalInfo!.name.toString()
              : ""
          : "";
      for (SelectionPopupModel gender in genderList) {
        if (gender.value!.toLowerCase() ==
            (currentFarmer.value.data != null
                ? currentFarmer.value.data!.generalInfo != null
                    ? currentFarmer.value.data!.generalInfo!.gender
                        .toString()
                        .toLowerCase()
                    : ""
                : "")) {
          selectedGender.value = gender;
        }
      }
      setDropdownsLists();
      selectedVillage.value = villagesDropdownList.firstWhere(
        (element) =>
            element.id ==
            (currentFarmer.value.data != null
                ? currentFarmer.value.data!.generalInfo != null
                    ? currentFarmer.value.data!.generalInfo!.villageId
                    : ""
                : ""),
        orElse: () => SelectionPopupModel(title: ""),
      );
      selectedGroup.value = groupsDropdownList.firstWhere(
        (element) =>
            element.id ==
            (currentFarmer.value.data != null
                ? currentFarmer.value.data!.generalInfo != null
                    ? currentFarmer.value.data!.generalInfo!.farmerGroupId
                    : ""
                : ""),
        orElse: () => SelectionPopupModel(title: ""),
      );

      selectedIdentity.value = identitysDropdownList.firstWhere(
        (element) =>
            element.title ==
            (currentFarmer.value.data != null
                ? currentFarmer.value.data!.generalInfo != null
                    ? currentFarmer.value.data!.generalInfo!.identityType
                    : ""
                : ""),
        orElse: () => SelectionPopupModel(title: ""),
      );

      farmerPhoneController.text = currentFarmer.value.data != null
          ? currentFarmer.value.data!.generalInfo != null
              ? currentFarmer.value.data!.generalInfo!.phoneNumber ?? ""
              : ""
          : "";
      dateController.text = currentFarmer.value.data != null
          ? currentFarmer.value.data!.generalInfo != null
              ? currentFarmer.value.data!.generalInfo!.dateOfBirth ?? ""
              : ""
          : "";
      farmerIdController.text = currentFarmer.value.data != null
          ? currentFarmer.value.data!.generalInfo != null
              ? currentFarmer.value.data!.generalInfo!.identityNumber ?? ""
              : ""
          : "";
      contactPersonNameController.text = currentFarmer.value.data != null
          ? currentFarmer.value.data!.generalInfo != null
              ? currentFarmer.value.data!.generalInfo!.contactPersonName ?? ""
              : ""
          : "";
      contactPersonPhoneController.text = currentFarmer.value.data != null
          ? currentFarmer.value.data!.generalInfo != null
              ? currentFarmer
                      .value.data!.generalInfo!.contactPersonPhoneNumber ??
                  ""
              : ""
          : "";
      selectedMembership.value = groupMembershipList.firstWhere(
        (element) =>
            element.value ==
            (currentFarmer.value.data != null
                ? currentFarmer.value.data!.generalInfo != null
                    ? currentFarmer.value.data!.generalInfo!.isMember
                    : ""
                : ""),
        orElse: () => SelectionPopupModel(title: ""),
      );
      selectedInstitutionType.value = institutionTypeList.firstWhere(
        (element) =>
            element.value ==
            (currentFarmer.value.data != null
                ? currentFarmer.value.data!.generalInfo != null
                    ? currentFarmer.value.data!.generalInfo!.institutionType
                        .toString()
                        .toUpperCase()
                    : ""
                : ""),
        orElse: () => SelectionPopupModel(title: ""),
      );
      selectedRegistrationType.value = registrationTypeList.firstWhere(
        (element) =>
            element.value ==
            (currentFarmer.value.data != null
                ? currentFarmer.value.data!.generalInfo != null
                    ? currentFarmer.value.data!.generalInfo!.registrationType
                        .toString()
                        .toUpperCase()
                    : ""
                : ""),
        orElse: () => SelectionPopupModel(title: ""),
      );

      farmInfos.value = currentFarmer.value.data != null
          ? currentFarmer.value.data!.farmInfo != null
              ? currentFarmer.value.data!.farmInfo ?? []
              : []
          : [];
      image.value = currentFarmer.value.data != null
          ? currentFarmer.value.data!.image != null
              ? ((currentFarmer.value.data!.image!.image ?? "")
                                  .replaceAll(RegExp(r'\s+'), ''))
                              .length %
                          4 ==
                      0
                  ? (currentFarmer.value.data!.image!.image ?? "")
                  : ""
              : ""
          : "";
      fingerPrintData.value = currentFarmer.value.data != null
          ? currentFarmer.value.data!.generalInfo != null
              ? currentFarmer.value.data!.generalInfo!.fingerPrintData ??
                  FingerPrintData()
              : FingerPrintData()
          : FingerPrintData();
    }
  }

  void setMultipleSelectionRequirementsList() {
    // areaOfOperationList.clear();
    // areaOfOperationList.value = (dashboardResponse.value.villages ?? [])
    //     .map((order) => MultiSelectItem<Villages>(order, order.name.toString()))
    //     .toList();
  }


  num calculateSurfaceArea(List<FarmCoordinates> coordinates) {
    num area = 0;
    if (coordinates.length >= 3) {
      List<LatLng> latLngs = [];
      for (int i = 0; i < coordinates.length + 1; i++) {
        FarmCoordinates point = i < coordinates.length
            ? coordinates.elementAt(i)
            : coordinates.first;
        LatLng latLng = LatLng(point.latitude!, point.longitude!);
        latLngs.add(latLng);
      }
      area = SphericalUtil.computeArea(latLngs);
    }
    area = area / 4047;
    return area.abs();
  }

  void setDropdownsLists() {
    selectedVillage.value = SelectionPopupModel(title: "");
    // villagesDropdownList.value = dashboardResponse.value.villages != null
    //     ? dashboardResponse.value.villages!
    //         .map<SelectionPopupModel>((Villages value) {
    //         return SelectionPopupModel(
    //           id: value.id,
    //           value: value,
    //           title: value.name.toString(),
    //         );
    //       }).toList()
    //     : [];

    selectedGroup.value = SelectionPopupModel(title: "");
    selectedIdentity.value = SelectionPopupModel(title: "");
    // groupsDropdownList.value = dashboardResponse.value.groups != null
    //     ? dashboardResponse.value.groups!
    //         .map<SelectionPopupModel>((Villages value) {
    //         return SelectionPopupModel(
    //           id: value.id,
    //           value: value,
    //           title: value.name.toString(),
    //         );
    //       }).toList()
    //     : [];
    // identitysDropdownList.value = dashboardResponse.value.identity != null
    //     ? dashboardResponse.value.identity!
    //         .map<SelectionPopupModel>((Identity value) {
    //         return SelectionPopupModel(
    //           id: value.id,
    //           value: value,
    //           title: value.name.toString(),
    //         );
    //       }).toList()
    //     : [];
  }
}

// class DropDown {
//   String? name;
//   String? value;
//   DropDown({this.name, this.value});
// }
