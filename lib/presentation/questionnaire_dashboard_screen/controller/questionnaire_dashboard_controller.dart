import 'dart:convert';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:saidi_s_application3/core/app_export.dart';

import '../../../core/utils/functions/global.dart';
import '../../../core/utils/functions/response_handeler.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/databases/shared_preferences_db.dart';
import '../../../data/models/apiModels/initial_data_response_model.dart';
import '../../../data/models/apiModels/profile_response_model.dart';
import '../../../data/models/apiModels/register_farmer_request_model.dart';

/// A controller class for the Iphone14PlusOneTabContainerScreen.
///
/// This class manages the state of the Iphone14PlusOneTabContainerScreen, including the
/// current iphone14PlusOneTabContainerModelObj
class QuestionnaireDashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ProfileResponse> userProfile = ProfileResponse().obs;
  Rx<InitialDataResponse> dashboardResponse = InitialDataResponse().obs;
  RxString applicationVersion = "".obs;
  Rx<RegisterFarmerRequest> localRegisterFarmerRequest =
      RegisterFarmerRequest(farmers: []).obs;

  @override
  void onInit() {
    super.onInit();
    getApplicationVersio();
    getDashoardDataOnline();
    // getOnlineFarmers();
  }

  void getApplicationVersio() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    applicationVersion.value = packageInfo.version;
  }

  // void getOnlineFarmers() async {
  //   // loadingDialog();
  //   bool internetTest = await checkInternetConnection();
  //   String token = await getAccessToken();
  //   localRegisterFarmerRequest.value = await getFarmerLocalData();

  //   if (internetTest) {
  //     try {
  //       final response =
  //           await ApiClient().getListOfQuestionnaireResponses(token);
  //       if (response.statusCode == 200) {
  //         // Get.back();
  //         RegisterFarmerRequest onlineFarmersResponse =
  //             RegisterFarmerRequest.fromJson(
  //                 jsonDecode(jsonEncode(response.body)));
  //         localRegisterFarmerRequest.value.farmers ??= [];
  //         localRegisterFarmerRequest.value.lastFarmerIndex ??= 0;

  //         List<Farmers> presentFarmer = [];
  //         List<Farmers> onlineDuplicateFarmers = [];
  //         for (Farmers farmer in (onlineFarmersResponse.farmers ?? [])) {
  //           localRegisterFarmerRequest.value.lastFarmerIndex =
  //               localRegisterFarmerRequest.value.lastFarmerIndex! + 1;
  //           farmer.registrationStatus = "edit";
  //           farmer.editingStatus = 0;
  //           farmer.id = localRegisterFarmerRequest.value.lastFarmerIndex;
  //           presentFarmer.addAll(
  //               (localRegisterFarmerRequest.value.farmers ?? [])
  //                   .where((p0) => ((p0.data!.generalInfo!.id ==
  //                           farmer.data!.generalInfo!.id) &&
  //                       (p0.editingStatus == 0)))
  //                   .toList());
  //         }

  //         for (Farmers farmer
  //             in (localRegisterFarmerRequest.value.farmers ?? [])) {
  //           onlineDuplicateFarmers.addAll((onlineFarmersResponse.farmers ?? [])
  //               .where((p0) => ((p0.data!.generalInfo!.id ==
  //                       farmer.data!.generalInfo!.id) &&
  //                   (farmer.editingStatus == 1)))
  //               .toList());
  //         }

  //         if (presentFarmer.isNotEmpty) {
  //           for (var element in presentFarmer) {
  //             localRegisterFarmerRequest.value.farmers!.remove(element);
  //           }
  //         }
  //         if (onlineDuplicateFarmers.isNotEmpty) {
  //           for (var element in onlineDuplicateFarmers) {
  //             onlineFarmersResponse.farmers!.remove(element);
  //           }
  //         }
  //         localRegisterFarmerRequest.value.farmers!
  //             .addAll(onlineFarmersResponse.farmers ?? []);
  //         setFarmerLocalData(localRegisterFarmerRequest.value);
  //         localRegisterFarmerRequest.refresh();
  //       } else {
  //         // Get.back();
  //         ResponseHandler().responseHandlerOnSinglePage(response);
  //       }
  //     } catch (e) {
  //       // Get.back();
  //       Get.defaultDialog(title: "Exception", middleText: e.toString());
  //     }
  //   } else {
  //     // Get.back();
  //     showErrorToast("errorInternet".tr);
  //   }
  // }

  void getDashoardDataOnline() async {
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    userProfile.value = await getprofileData();
    if (internetTest) {
      final response = await ApiClient()
          .getDashboardResponse(userProfile.value.profile!.id, token);
      if (response.statusCode == 200) {
        if (response.body != null) {
          dashboardResponse.value = InitialDataResponse.fromJson(
              jsonDecode(jsonEncode(response.body)));
          setDashboardData(dashboardResponse.value);
        }
      } else if (response.statusCode == 401) {
        logOut();
      } else {
        ResponseHandler().responseHandlerOnSinglePage(response);
      }
    }
  }
}
