import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_routes.dart';



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

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

