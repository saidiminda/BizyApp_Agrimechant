import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';

// Function for logging Out
void logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("accessToken");
  Get.offAllNamed(AppRoutes.loginScreen);
}

// Function for looking fro internet connection
Future<bool> checkInternetConnection() async {
  try {
    final response = await InternetAddress.lookup('google.com');
    return response.isNotEmpty && response[0].rawAddress.isNotEmpty;
  } on SocketException catch (e) {
    print(e);
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

// Function for logging Out
// void directTochangePassword(ProfileResponse? profileResponse) async {
//   if (profileResponse != null) {
//     if (profileResponse.profile != null) {
//       if (profileResponse.profile!.isActive == "INACTIVE") {
//         logOut();
//       }
//       // else if (profileResponse.profile!.changePassword == 1) {
//       //   Get.offAllNamed(Routes.CHANGE_PASSWORD_PAGE);
//       // }
//     }
//   }
// }

//tost functions
void showErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showNoErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
