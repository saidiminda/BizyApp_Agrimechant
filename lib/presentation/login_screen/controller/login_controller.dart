import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:saidi_s_application3/core/app_export.dart';
import 'package:saidi_s_application3/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/global_fanctions.dart';
import '../../../core/utils/response_handeler.dart';
import '../../../data/databases/shared_preferences_db.dart';
import '../../../data/models/global_modal/profile_response_model.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../providers/login_request_provider.dart';

/// A controller class for the Iphone14PlusEightScreen.
///
/// This class manages the state of the Iphone14PlusEightScreen, including the
/// current iphone14PlusEightModelObj
class LoginController extends GetxController with GetTickerProviderStateMixin {
  TextEditingController inputnameoneController = TextEditingController();

  TextEditingController inputsecretoneController = TextEditingController();
  late AnimationController animationController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var barLength = 0.0.obs;
  bool determinate = false;
  RxString waitStatus = "wait".tr.obs;
  RxBool showLoading = false.obs;
  RxBool hidePassword = true.obs;

  Rx<LoginModel> iphone14PlusEightModelObj = LoginModel().obs;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        barLength.value = animationController.value;
      });
    animationController.repeat();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
    inputnameoneController.dispose();
    inputsecretoneController.dispose();
  }

  void authenticateUser(String username, String password) async {
    //Starting Loading dialog
    showLoading.value = true;
    waitStatus.value = "wait".tr;

    bool internetTest = await checkInternetConnection();
    LoginRequest loginObj =
        LoginRequest(username: username, password: password);

    if (internetTest) {
      try {
        final response =
            await LoginRequestProvider().postLoginRequest(loginObj);
        log(response.body.toString());
        if (response.statusCode == 200) {
          LoginResponse loginResponse =
              LoginResponse.fromJson(jsonDecode(jsonEncode(response.body)));
          if (loginResponse.code == 1) {
            setAccessToken(loginResponse.token.toString());
            ProfileResponse userProfile =
                ProfileResponse(profile: loginResponse.user!);
            setprofileData(userProfile);
            Get.offAllNamed(AppRoutes.dashboardScreen);
          } else {
            Fluttertoast.showToast(
                msg: "usernameOrPasswordIsIncorrect".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        } else if (response.statusCode == 401) {
          Fluttertoast.showToast(
              msg: "usernameOrPasswordIsIncorrect".tr,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          ResponseHandler().responseHandlerOnSinglePage(response);
        }
      } catch (e) {
        //Starting Exception dialog
        Fluttertoast.showToast(
            msg: "failedSystemError".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      showLoading.value = false;
    } else {
      showLoading.value = false;
      Fluttertoast.showToast(
          msg: "errorInternet".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
