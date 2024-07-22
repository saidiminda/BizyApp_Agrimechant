import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/functions/global.dart';
import '../../../core/utils/functions/response_handeler.dart';
import '../../../core/utils/functions/show_dialogs.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/databases/shared_preferences_db.dart';
import '../../../data/models/apiModels/initial_data_response_model.dart';
import '../../../data/models/apiModels/profile_response_model.dart';
import '../../../data/models/questionnaires_request_model.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

/// A controller class for the FarmerRegistrationScreen.
///
/// This class manages the state of the FarmerRegistrationScreen, including the
/// current farmerRegistrationModelObj
class AggregatorsRegistrationController extends GetxController {
  String regType = Get.arguments["type"];
  QuestionnaireResponse? offlineFarmer = Get.arguments["questionnair"];
  RxBool edit = false.obs;
  TextEditingController jinaController = TextEditingController();

  TextEditingController baruapepeyaController = TextEditingController();

  TextEditingController jinalaController = TextEditingController();

  TextEditingController nambariyaController = TextEditingController();

  TextEditingController nambariyatinController = TextEditingController();

  TextEditingController majinakamiliController = TextEditingController();

  TextEditingController anwaniController = TextEditingController();
  TextEditingController howDoYouEnsureThatTheRightQualityController =
      TextEditingController();
       TextEditingController designationController = TextEditingController();

  TextEditingController otherValueChainsDoYouOperateInController =
      TextEditingController();
  Rx<QuestionnaireResponse> currentQuestionnaireResponse =
      QuestionnaireResponse().obs;
  Rx<ProfileResponse> userProfile = ProfileResponse().obs;
  Rx<InitialDataResponse> dashboardResponse = InitialDataResponse().obs;
  List<SelectionPopupModel> genderList = [
    SelectionPopupModel(title: "male".tr, value: "Male"),
    SelectionPopupModel(title: "female".tr, value: "Female")
  ];
  List<SelectionPopupModel> institutionTypeList = [
    SelectionPopupModel(title: "Serikali", value: "GOV"),
    SelectionPopupModel(title: "Chama kikuu", value: "UNION"),
    SelectionPopupModel(title: "Chama cha msingi", value: "AMCOS"),
    SelectionPopupModel(
        title: "Ushilika wa wakulima", value: "COMMERCIAL FARMERS"),
    SelectionPopupModel(title: "Siyo ya kiserikali (NGOs)", value: "NGOs")
  ];
  List<SelectionPopupModel> majorProblemsList = [
    SelectionPopupModel(
        title: "Licensing and Certification",
        value: "LICENSING AND CERTIFICATION"),
    SelectionPopupModel(
        title: "Exporting regulations", value: "EXPORTING REGULATIONS"),
    SelectionPopupModel(title: "Taxes", value: "TAXES"),
    SelectionPopupModel(
        title: "Government support", value: "GOVERNMENT SUPPORT"),
  ];
  List<SelectionPopupModel> sourceOfEnergyList = [
    SelectionPopupModel(
        title: "Standard electricity", value: "STANDARD ELECTRICITY"),
    SelectionPopupModel(title: "Solar", value: "SOLAR"),
    SelectionPopupModel(title: "Generator", value: "GENERATOR"),
  ];

  List<SelectionPopupModel> trainingList = [
    SelectionPopupModel(title: "Grading".tr, value: "Grading"),
    SelectionPopupModel(
        title: "Post-harvest activities".tr, value: "POST-HARVEST ACTIVITIES"),
    SelectionPopupModel(title: "Warehousing".tr, value: "WAREHOUSING"),
    SelectionPopupModel(
        title: "Quality control measures".tr,
        value: "QUALITY CONTROL MEASURES"),
    SelectionPopupModel(
        title: "Certification in Quality, Food safety, HACCP? GLOBALG.A.P".tr,
        value: "CERTIFICATION IN QUALITY, FOOD SAFETY, HACCP? GLOBALG.A.P.")
  ];
  Rx<SelectionPopupModel> selectedGender = SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedMajorProblem =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selecetTraining = SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedInstitutionType =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedMembership =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedSourceOfEnergy =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedVillage = SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedRelevantCrop =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedEducationLevel =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedBusinessType =
      SelectionPopupModel(title: "").obs;
  Rx<SelectionPopupModel> selectedOtherValueChain =
      SelectionPopupModel(title: "").obs;
  RxList<SelectionPopupModel> villagesDropdownList =
      <SelectionPopupModel>[].obs;
  RxList<SelectionPopupModel> relevantCropsDropdownList =
      <SelectionPopupModel>[].obs;
  RxList<SelectionPopupModel> educationLevelsDropdownList =
      <SelectionPopupModel>[].obs;
  RxList<SelectionPopupModel> businessTypeDropdownList =
      <SelectionPopupModel>[].obs;
  RxList<SelectionPopupModel> otherValueChainsDropdownList =
      <SelectionPopupModel>[].obs;

  Rx<SelectionPopupModel> selectedDifficulties =
      SelectionPopupModel(title: "").obs;
  RxList<SelectionPopupModel> difficultiesDropdownList =
      <SelectionPopupModel>[].obs;
  Rx<SelectionPopupModel> selectedMarketInformation =
      SelectionPopupModel(title: "").obs;
  RxList<SelectionPopupModel> marketInformationDropdownList =
      <SelectionPopupModel>[].obs;
  List<SelectionPopupModel> areYouCurrentlyAMemberOfAnyValueChainList = [
    SelectionPopupModel(title: "yes".tr, value: "YES"),
    SelectionPopupModel(title: "no".tr, value: "NO")
  ];
  Rx<SelectionPopupModel> selectedAreYouCurrentlyAMember =
      SelectionPopupModel(title: "").obs;
  List<SelectionPopupModel> howDoesYourEntityPromoteList = [
    SelectionPopupModel(
        title: "Contract with local buyers".tr,
        value: "Contract with local buyers"),
    SelectionPopupModel(
        title: "Contract with foreign buyers".tr,
        value: "Contract with foreign buyers"),
    SelectionPopupModel(
        title: "Ad-hoc sales to local buyers".tr,
        value: "Ad-hoc sales to local buyers"),
  ];
  Rx<SelectionPopupModel> selectedHowDoesYourEntityPromoter =
      SelectionPopupModel(title: "").obs;

  Rx<SelectionPopupModel> selectedRegion = SelectionPopupModel(title: "").obs;
  RxList<SelectionPopupModel> regionList = <SelectionPopupModel>[].obs;
  RxList<Buyers> currentBuyers = <Buyers>[Buyers(), Buyers(), Buyers()].obs;
  RxList<String> currentCompetitors = <String>["", "", ""].obs;
  List<SelectionPopupModel> mensurementList = [
    SelectionPopupModel(title: "litres".tr, value: "LITRES"),
    SelectionPopupModel(title: "MT".tr, value: "MT"),
    SelectionPopupModel(title: "KG".tr, value: "KG")
  ];
  RxList<NumberOfEmployees> employees = <NumberOfEmployees>[
    NumberOfEmployees(title: "permanent".tr, type: "PERMANENT"),
    NumberOfEmployees(title: "casualOrTemporary".tr, type: "TEMPORARY")
  ].obs;
  RxList<AnnualSales> annualSalesList = <AnnualSales>[
    AnnualSales(year: DateTime.now().year - 3),
    AnnualSales(year: DateTime.now().year - 2),
    AnnualSales(year: DateTime.now().year - 1)
  ].obs;
  Rx<AnnualCost> annualCost = AnnualCost().obs;
  RxList<FinanceUsed> financeUsedList = <FinanceUsed>[
    FinanceUsed(title: "ownersEquity".tr, name: "Owner's Equity"),
    FinanceUsed(title: "bank".tr, name: "Bank"),
    FinanceUsed(title: "familyAndRelations".tr, name: "Family and Relations"),
    FinanceUsed(title: "grants".tr, name: "Grants")
  ].obs;
  RxList<Production> annualProductionList = <Production>[
    Production(year: DateTime.now().year - 3),
    Production(year: DateTime.now().year - 2),
    Production(year: DateTime.now().year - 1)
  ].obs;
  RxList<CropProductionAggregation> cropProductionAggregationList =
      <CropProductionAggregation>[
    CropProductionAggregation(year: DateTime.now().year - 3),
    CropProductionAggregation(year: DateTime.now().year - 2),
    CropProductionAggregation(year: DateTime.now().year - 1)
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getFarmerOffline(offlineFarmer);
  }

  @override
  void onReady() {
    super.onReady();
    getDashoardDataOnline();
  }

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

  void getDashoardDataOnline() async {
    loadingDialog();
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    userProfile.value = await getprofileData();
    if (internetTest) {
      final response = await ApiClient()
          .getDashboardResponse(userProfile.value.profile!.id, token);
      if (response.statusCode == 200) {
        Get.back();
        if (response.body != null) {
          dashboardResponse.value = InitialDataResponse.fromJson(
              jsonDecode(jsonEncode(response.body)));
          setDashboardData(dashboardResponse.value);
          setDropdownsLists();
        }
      } else if (response.statusCode == 401) {
        logOut();
      } else {
        Get.back();
        ResponseHandler().responseHandlerOnSinglePage(response);
      }
    } else {
      Get.back();
      showErrorToast("noInternet".tr);
    }
  }

  void setDropdownsLists() {
    selectedVillage.value = SelectionPopupModel(title: "");
    villagesDropdownList.value = dashboardResponse.value.villages != null
        ? dashboardResponse.value.villages!
            .map<SelectionPopupModel>((Crops value) {
            return SelectionPopupModel(
              id: value.id,
              value: value,
              title: value.name.toString(),
            );
          }).toList()
        : [];

    selectedRelevantCrop.value = SelectionPopupModel(title: "");
    relevantCropsDropdownList.value = dashboardResponse.value.crops != null
        ? dashboardResponse.value.crops!
            .map<SelectionPopupModel>((Crops value) {
            return SelectionPopupModel(
              id: value.id,
              value: value,
              title: value.name.toString(),
            );
          }).toList()
        : [];
    selectedEducationLevel.value = SelectionPopupModel(title: "");
    educationLevelsDropdownList.value =
        dashboardResponse.value.educationLevels != null
            ? dashboardResponse.value.educationLevels!
                .map<SelectionPopupModel>((Crops value) {
                return SelectionPopupModel(
                  id: value.id,
                  value: value,
                  title: value.name.toString(),
                );
              }).toList()
            : [];

    selectedBusinessType.value = SelectionPopupModel(title: "");
    businessTypeDropdownList.value =
        dashboardResponse.value.businessType != null
            ? dashboardResponse.value.businessType!
                .map<SelectionPopupModel>((Crops value) {
                return SelectionPopupModel(
                  id: value.id,
                  value: value,
                  title: value.name.toString(),
                );
              }).toList()
            : [];
    selectedOtherValueChain.value = SelectionPopupModel(title: "");
    otherValueChainsDropdownList.value =
        dashboardResponse.value.valueChainActivities != null
            ? dashboardResponse.value.valueChainActivities!
                .map<SelectionPopupModel>((Crops value) {
                return SelectionPopupModel(
                  id: value.id,
                  value: value,
                  title: value.name.toString(),
                );
              }).toList()
            : [];

    selectedRegion.value = SelectionPopupModel(title: "");
    regionList.value = dashboardResponse.value.regions != null
        ? dashboardResponse.value.regions!
            .map<SelectionPopupModel>((Crops value) {
            return SelectionPopupModel(
              id: value.id,
              value: value,
              title: value.name.toString(),
            );
          }).toList()
        : [];

    selectedDifficulties.value = SelectionPopupModel(title: "");
    difficultiesDropdownList.value =
        dashboardResponse.value.difficulties != null
            ? dashboardResponse.value.difficulties!
                .map<SelectionPopupModel>((Crops value) {
                return SelectionPopupModel(
                  id: value.id,
                  value: value,
                  title: value.name.toString(),
                );
              }).toList()
            : [];
    selectedMarketInformation.value = SelectionPopupModel(title: "");
    marketInformationDropdownList.value =
        dashboardResponse.value.marketInformation != null
            ? dashboardResponse.value.marketInformation!
                .map<SelectionPopupModel>((Crops value) {
                return SelectionPopupModel(
                  id: value.id,
                  value: value,
                  title: value.name.toString(),
                );
              }).toList()
            : [];
  }

  void registerQuestionnaireResponse() async {
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
    currentQuestionnaireResponse = QuestionnaireResponse(
      questionnaireCategoryId: 2,
      basicInformation: BasicInformation(
          cropId: selectedRelevantCrop.value.id,
          nameOfEntity: jinalaController.text,
          villageId: selectedVillage.value.id,
          educationLevelId: selectedEducationLevel.value.id,
          type: "AGGREGATOR",
          age: nambariyatinController.text,
          contactPerson: ContactPerson(
              name: jinaController.text,
              designation: designationController.text,
              gender: selectedGender.value.value,
              emailAddress: baruapepeyaController.text,
              phoneNo: nambariyaController.text)),
      socioEconomic: SocioEconomic(
          businessRegistrationTypeId: selectedBusinessType.value.id,
          valueChainActivities: [selectedOtherValueChain.value.id ?? 0],
          entityPromote: [selectedHowDoesYourEntityPromoter.value.title],
          competitors: currentCompetitors,
          difficulties: selectedDifficulties.value.id != null
              ? [selectedDifficulties.value.id!]
              : [],
          otherDifficulties: [],
          marketInformations: selectedMarketInformation.value.id != null
              ? [selectedMarketInformation.value.id!]
              : null,
          annualCost: [annualCost.value],
          annualSales: annualSalesList,
          problemsRelatedPolicy: [],
          financeUsed: financeUsedList,
          significantChallenges: [],
          formalRecord: FormalRecord(),
          valueChainOrganization: ValueChainOrganization(
              isYes: selectedAreYouCurrentlyAMember.value.value),
          numberOfEmployees: employees,
          otherValueChains: otherValueChainsDoYouOperateInController.text,
          buyers: currentBuyers),
      coreBusinesses: CoreBusinesses(
          warehouseSourceEnergy: selectedSourceOfEnergy.value.title,
          typeOfEquipment: [],
          sourceOfInputs: [],
          cropProductionAggregation: cropProductionAggregationList,
          sourceProductionInputs: [],
          logisticsActivities: [],
          logisticsCrops: [],
          qualityOfInputsSuppliers:
              howDoYouEnsureThatTheRightQualityController.text,
          productionAggregation: ProductionAggregation(
              production: [], aggregation: annualProductionList),
          annualTradingVolumes: []),
    ).obs;
    QuestionnairesRequest registerfarmerrequest = QuestionnairesRequest(
        // imeiNumber: deviceid.value,
        // appVersionName: applicationVersion.value,
        date: todayDate,
        time: time,
        questionnaireResponse: [currentQuestionnaireResponse.value]);

    if (internetTest) {
      final response = await ApiClient()
          .postSendQuestionnaireResponsesRequest(registerfarmerrequest, token);
      if (response.statusCode == 200) {
        if ((response.body["code"] ?? 0) == 1) {
          //
          selectedGender.value = SelectionPopupModel(title: "");
          selectedMembership.value = SelectionPopupModel(title: "");
          // selectedRegistrationType.value = SelectionPopupModel(title: "");
          // selectedGroup.value = SelectionPopupModel(title: "");
          selectedVillage.value = SelectionPopupModel(title: "");
          // selectedIdentity.value = SelectionPopupModel(title: "");
          // selecetedCommunitySeedBanks.value = [];
          // ownSmartPhone.value = false;
          // farmerPhoneController.text = "";
          // dateController.text = "";
          // farmerIdController.text = "";
          // contactP   ersonNameController.text = "";
          // contactPersonPhoneController.text = "";
          // edit.value = false;
          // image.value = "";
          // farmInfos.clear();
          // currentStep.value = 0;
          Get.back();
          showNoErrorToast("successfully".tr);
          // List<Farmers> presentFarmer =
          //     (localRegisterFarmerRequest.value.farmers ?? [])
          //         .where((p0) =>
          //             (p0.data!.generalInfo!.wallet ==
          //                 farmerNumberController.text) ||
          //             (p0.data!.generalInfo!.id == currentQuestionnaireResponse.value.id))
          //         .toList();
          // if (presentFarmer.isNotEmpty) {
          //   for (var element in presentFarmer) {
          //     localRegisterFarmerRequest.value.farmers!.remove(element);
          //   }
          // setFarmerLocalData(localRegisterFarmerRequest.value);
          // }
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
      // localRegisterFarmerRequest.value.farmers ??= [];
      // localRegisterFarmerRequest.value.lastFarmerIndex ??= 0;
      // Farmers farmer = currentQuestionnaireResponse.value;
      // farmer.registrationStatus ??= regType;
      // farmer.editingStatus = 1;
      // if (farmer.id! < 1) {
      //   localRegisterFarmerRequest.value.lastFarmerIndex =
      //       localRegisterFarmerRequest.value.lastFarmerIndex! + 1;
      //   farmer.id = localRegisterFarmerRequest.value.lastFarmerIndex;
      // }

      // farmer.data!.generalInfo!.wallet ??= farmerNumberController.text;
      // List<Farmers> presentFarmer =
      //     (localRegisterFarmerRequest.value.farmers ?? [])
      //         .where((p0) => (((p0.data!.generalInfo!.wallet ==
      //                     farmer.data!.generalInfo!.wallet) &&
      //                 p0.data!.generalInfo!.wallet != null) ||
      //             (p0.id == farmer.id) ||
      //             ((p0.data!.generalInfo!.id == farmer.data!.generalInfo!.id) &&
      //                 farmer.data!.generalInfo!.id != null)))
      //         .toList();
      // if (presentFarmer.isNotEmpty) {
      //   for (var element in presentFarmer) {
      //     localRegisterFarmerRequest.value.farmers!.remove(element);
      //   }
      //   localRegisterFarmerRequest.value.farmers!.add(farmer);
      //   setFarmerLocalData(localRegisterFarmerRequest.value);
      // } else {
      //   localRegisterFarmerRequest.value.farmers!.add(farmer);
      //   setFarmerLocalData(localRegisterFarmerRequest.value);
      // }

      // localRegisterFarmerRequest.refresh();

      // farmerNumberController.text = "";
      // farmerNameController.text = "";
      // selectedGender.value = SelectionPopupModel(title: "");
      // selectedMembership.value = SelectionPopupModel(title: "");
      // selectedRegistrationType.value = SelectionPopupModel(title: "");
      // selectedGroup.value = SelectionPopupModel(title: "");
      // selectedVillage.value = SelectionPopupModel(title: "");
      // selectedIdentity.value = SelectionPopupModel(title: "");
      // farmerPhoneController.text = "";
      // dateController.text = "";
      // farmerIdController.text = "";
      // contactPersonNameController.text = "";
      // contactPersonPhoneController.text = "";
      // edit.value = false;
      // image.value = "";
      // farmInfos.clear();
      // currentStep.value = 0;
      // Get.back();
      showCastomDialog(
          "Taarifa zimehifadhiwa kwenye simu, Nje ya mtandao", Colors.green);
    }
  }

  void getFarmerOffline(QuestionnaireResponse? farmer) async {
    if (farmer != null) {
      edit.value = true;
      currentQuestionnaireResponse.value = farmer;
      for (SelectionPopupModel gender in genderList) {
        if (gender.value!.toLowerCase() ==
            (currentQuestionnaireResponse.value.basicInformation != null
                ? currentQuestionnaireResponse
                            .value.basicInformation!.contactPerson !=
                        null
                    ? currentQuestionnaireResponse
                        .value.basicInformation!.contactPerson!.gender
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
            (currentQuestionnaireResponse.value.basicInformation != null
                ? currentQuestionnaireResponse.value.basicInformation!.villageId
                : ""),
        orElse: () => SelectionPopupModel(title: ""),
      );

      nambariyaController.text =
          currentQuestionnaireResponse.value.basicInformation != null
              ? currentQuestionnaireResponse
                          .value.basicInformation!.contactPerson !=
                      null
                  ? currentQuestionnaireResponse
                          .value.basicInformation!.contactPerson!.phoneNo ??
                      ""
                  : ""
              : "";
      nambariyatinController.text =
          currentQuestionnaireResponse.value.basicInformation != null
              ? currentQuestionnaireResponse.value.basicInformation!.age ?? ""
              : "";

      jinaController.text =
          currentQuestionnaireResponse.value.basicInformation != null
              ? currentQuestionnaireResponse
                          .value.basicInformation!.contactPerson !=
                      null
                  ? currentQuestionnaireResponse
                          .value.basicInformation!.contactPerson!.name ??
                      ""
                  : ""
              : "";
      jinalaController.text =
          currentQuestionnaireResponse.value.basicInformation != null
              ? currentQuestionnaireResponse
                      .value.basicInformation!.nameOfEntity ??
                  ""
              : "";
      baruapepeyaController.text =
          currentQuestionnaireResponse.value.basicInformation != null
              ? currentQuestionnaireResponse
                          .value.basicInformation!.contactPerson !=
                      null
                  ? currentQuestionnaireResponse.value.basicInformation!
                          .contactPerson!.emailAddress ??
                      ""
                  : ""
              : "";
      otherValueChainsDoYouOperateInController.text =
          currentQuestionnaireResponse.value.socioEconomic != null
              ? currentQuestionnaireResponse
                      .value.socioEconomic!.otherValueChains ??
                  ""
              : "";
    }
  }
}
