import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/functions/global.dart';
import '../../../core/utils/functions/response_handeler.dart';
import '../../../core/utils/functions/show_dialogs.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/databases/shared_preferences_db.dart';
import '../../../data/models/apiModels/change_password_request_model.dart';
import '../../../data/models/apiModels/entity_id_and_user_id_request_body_model.dart';
import '../../../data/models/apiModels/profile_response_model.dart';

class ChangePasswordController extends GetxController {
  late TextEditingController passwordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool hidePassword = true.obs;
  final passwordFormat =
      RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@\\?#\$%\\^&\\*]).{8,}");
  Rx<ProfileResponse> userProfile = ProfileResponse().obs;
  RxString deviceid = "".obs;
  RxString applicationVersion = "".obs;
  RxInt changePasswordNeed = 0.obs;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    getDeviceId();
  }

  @override
  void onReady() {
    super.onReady();
    getUserProfileOnline();
  }

  void getDeviceId() async {
    // deviceid.value = (await PlatformDeviceId.getDeviceId).toString();
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // applicationVersion.value = packageInfo.version;
  }

  void getUserProfileOnline() async {
    bool internetTest = await checkInternetConnection();
    String token = await getAccessToken();
    userProfile.value = await getprofileData();
    changePasswordNeed.value = userProfile.value.profile!.changePassword!;
    String firebaseDeviceID = await getDeviceToken();
    EntityIdAndUserIdRequestBody requestBodyData = EntityIdAndUserIdRequestBody(
        deviceId: firebaseDeviceID,
        entityId: userProfile.value.profile!.id,
        userId: userProfile.value.profile!.id);
    if (internetTest) {
      final response =
          await ApiClient().postProfileResponse(requestBodyData, token);
      if (response.statusCode == 200) {
        if (response.body != null) {
          userProfile.value =
              ProfileResponse.fromJson(jsonDecode(jsonEncode(response.body)));

          setprofileData(userProfile.value);
          changePasswordNeed.value = userProfile.value.profile!.changePassword!;
        }
      } else if (response.statusCode == 401) {
        logOut();
      } else {
        // progress.cancel();
        // Toast.makeText(self,R.string.failed_system_error,Toast.LENGTH_LONG).show();
      }
    }
  }

  void changePassword() async {
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

    ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
        userId: userProfile.value.profile!.id,
        imeiNumber: deviceid.value,
        appVersionName: applicationVersion.value,
        date: todayDate,
        time: time,
        oldPassword: passwordController.text,
        newPassword: newPasswordController.text);

    if (internetTest) {
      final response = await ApiClient()
          .postChangePasswordRequest(changePasswordRequest, token);
      if (response.statusCode == 200) {
        Get.back();
        passwordController.text = "";
        confirmPasswordController.text = "";
        newPasswordController.text = "";
        Get.defaultDialog(title: "", middleText: "umebadili kwa mafanikio");
        changePasswordNeed.value = 0;
        userProfile.value.profile!.changePassword = 0;
        setprofileData(userProfile.value);
      } else if (response.statusCode == 401) {
        logOut();
      } else if (response.statusCode == 206) {
        Get.back();
        ResponseHandler().responseHandlerOnSinglePage(response);
      } else {
        Get.back();
        ResponseHandler().responseHandlerOnSinglePage(response);
        // Toast.makeText(getActivity(), getResources().getString(R.string.failed_system_error), Toast.LENGTH_SHORT).show();
      }
    }
  }
}
