import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidi_s_application3/core/utils/size_utils.dart';

import '../../../core/utils/functions/global.dart';
import '../../../core/utils/functions/response_handeler.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/databases/shared_preferences_db.dart';
import '../../../data/models/apiModels/initial_data_response_model.dart';
import '../../../data/models/apiModels/register_farmer_request_model.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/topNavBar.dart';
import '../models/farmer_management_model.dart';

/// A controller class for the FarmerManagementScreen.
///
/// This class manages the state of the FarmerManagementScreen, including the
/// current farmerManagementModelObj
class FarmerManagementController extends GetxController {
  Rx<InitialDataResponse> dashboardResponse = InitialDataResponse().obs;
  Rx<FarmerManagementModel> farmerManagementModelObj =
      FarmerManagementModel().obs;
  Rx<RegisterFarmerRequest> localRegisterFarmerRequest =
      RegisterFarmerRequest(farmers: []).obs;
  SampleItem? selectedMenu;
  @override
  void onInit() {
    super.onInit();
    getLocalData();
    // getOnlineFarmers();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getLocalData() async {
    dashboardResponse.value = await getDashboardData();
  }

  void getOnlineFarmers() async {
    // loadingDialog();
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    localRegisterFarmerRequest.value = await getFarmerLocalData();
    if (internetTest) {
      try {
        final response =
            await ApiClient().getListOfQuestionnaireResponses(token,"");
        if (response.statusCode == 200) {
          // Get.back();
          RegisterFarmerRequest onlineFarmersResponse =
              RegisterFarmerRequest.fromJson(
                  jsonDecode(jsonEncode(response.body)));
          localRegisterFarmerRequest.value.farmers ??= [];
          localRegisterFarmerRequest.value.lastFarmerIndex ??= 0;
          (localRegisterFarmerRequest.value.farmers ?? [])
              .removeWhere((p0) => ((p0.editingStatus == 0)));

          List<Farmers> presentFarmer = [];
          List<Farmers> onlineDuplicateFarmers = [];
          for (Farmers farmer in (onlineFarmersResponse.farmers ?? [])) {
            localRegisterFarmerRequest.value.lastFarmerIndex =
                localRegisterFarmerRequest.value.lastFarmerIndex! + 1;
            farmer.registrationStatus = "edit";
            farmer.editingStatus = 0;
            farmer.id = localRegisterFarmerRequest.value.lastFarmerIndex;
            presentFarmer.addAll(
                (localRegisterFarmerRequest.value.farmers ?? [])
                    .where((p0) => ((p0.data!.generalInfo!.id ==
                            farmer.data!.generalInfo!.id) &&
                        (p0.editingStatus == 0)))
                    .toList());
          }

          for (Farmers farmer
              in (localRegisterFarmerRequest.value.farmers ?? [])) {
            onlineDuplicateFarmers.addAll((onlineFarmersResponse.farmers ?? [])
                .where((p0) => ((p0.data!.generalInfo!.id ==
                        farmer.data!.generalInfo!.id) &&
                    (farmer.editingStatus == 1)))
                .toList());
          }

          if (presentFarmer.isNotEmpty) {
            for (var element in presentFarmer) {
              localRegisterFarmerRequest.value.farmers!.remove(element);
            }
          }
          if (onlineDuplicateFarmers.isNotEmpty) {
            for (var element in onlineDuplicateFarmers) {
              onlineFarmersResponse.farmers!.remove(element);
            }
          }
          localRegisterFarmerRequest.value.farmers!
              .addAll(onlineFarmersResponse.farmers ?? []);
          setFarmerLocalData(localRegisterFarmerRequest.value);
          localRegisterFarmerRequest.refresh();
        } else {
          // Get.back();
          ResponseHandler().responseHandlerOnSinglePage(response);
        }
      } catch (e) {
        // Get.back();
        Get.defaultDialog(title: "Exception", middleText: e.toString());
      }
    } else {
      // Get.back();
      Get.defaultDialog(
          title: "Sorry", middleText: "Check internet connection");
    }
  }

  void showFamerBottomSheet(Farmers farmer) {
    Get.bottomSheet(
        DraggableScrollableSheet(
          initialChildSize: 0.7,
          // maxChildSize: 1.0,
          minChildSize: 0.7,
          builder: (context, scrollController) => Container(
            decoration: BoxDecoration(
              color: appTheme.lightGreen50,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: ((farmer.data ?? Data()).imageUrl != null &&
                              (farmer.data ?? Data()).imageUrl != "")
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                7.h,
                              ),
                              child: Image.network(
                                (farmer.data ?? Data()).imageUrl ?? "",
                                height: Get.height / 4,
                                // width: Get.width,
                                fit: BoxFit.fitHeight,
                                errorBuilder: (context, error, stackTrace) =>
                                    CustomImageView(
                                  imagePath:
                                      'assets/images/image_not_found.png',
                                  height: 129.v,
                                  width: 134.h,
                                  color: Colors.black,
                                  radius: BorderRadius.circular(
                                    7.h,
                                  ),
                                ),
                              ),
                            )
                          : (((farmer.data ?? Data()).image ?? FarmerImage())
                                          .image !=
                                      null &&
                                  ((farmer.data ?? Data()).image ??
                                              FarmerImage())
                                          .image !=
                                      "")
                              ? Container(
                                  height: 129.v,
                                  width: 134.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: MemoryImage(base64Decode(
                                          (((farmer.data ?? Data()).image ??
                                                          FarmerImage())
                                                      .image ??
                                                  "")
                                              .replaceAll(RegExp(r'\s+'), ''))),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      7.h,
                                    ),
                                  ),
                                )
                              : CustomImageView(
                                  imagePath:
                                      'assets/images/image_not_found.png',
                                  height: 129.v,
                                  width: 134.h,
                                  color: Colors.black,
                                  radius: BorderRadius.circular(
                                    7.h,
                                  ),
                                ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.v),
                        Text(
                          "farmerName".tr.toUpperCase(),
                          style: CustomTextStyles.titleSmallSemiBold,
                        ),
                        Text(
                            ((farmer.data ?? Data()).generalInfo ??
                                    GeneralInfo())
                                .name
                                .toString(),
                            style: CustomTextStyles.labelLargeBlack900),
                        SizedBox(height: 8.v),
                        Text(
                          "lbl_phone_number".tr.toUpperCase(),
                          style: CustomTextStyles.titleSmallSemiBold,
                        ),
                        Text(
                            ((farmer.data ?? Data()).generalInfo ??
                                    GeneralInfo())
                                .phoneNumber
                                .toString(),
                            style: CustomTextStyles.labelLargeBlack900),
                        SizedBox(height: 8.v),
                        Text(
                          'identityType'.tr.toUpperCase(),
                          style: CustomTextStyles.titleSmallSemiBold,
                        ),
                        Text(
                            ((farmer.data ?? Data()).generalInfo ??
                                    GeneralInfo())
                                .identityType
                                .toString(),
                            style: CustomTextStyles.labelLargeBlack900),
                        SizedBox(height: 8.v),
                        Text(
                          'identityNumber'.tr.toUpperCase(),
                          style: CustomTextStyles.titleSmallSemiBold,
                        ),
                        Text(
                            ((farmer.data ?? Data()).generalInfo ??
                                    GeneralInfo())
                                .identityNumber
                                .toString(),
                            style: CustomTextStyles.labelLargeBlack900),
                        SizedBox(height: 2.v),
                      ],
                    ),
                    SizedBox(height: 2.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        isScrollControlled: true);
  }
}
