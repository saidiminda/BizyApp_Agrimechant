import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/global_modal/profile_response_model.dart';

// Function for setting daccess token in Shared Preference
void setAccessToken(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('accessToken', data);
}

//Function for getting access token in Shared Preference
Future<String> getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.containsKey("accessToken")
      ? (prefs.getString("accessToken") ?? "")
      : "";
  return token;
}

//Function for set and  getting user profile in Shared Preference
Future<ProfileResponse> getprofileData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getString("profile") ?? "";
  Map<String, dynamic> profileMap = jsonDecode(data) as Map<String, dynamic>;
  ProfileResponse profile = ProfileResponse.fromJson(profileMap);
  return profile;
}

void setprofileData(ProfileResponse data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('profile', jsonEncode(data));
}

//Function for set and  getting Online Dropdown Items in Shared Preference
// Future<DashboardResponse> getDashboardData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final data = prefs.containsKey("accessToken")
//       ? prefs.getString("dashboard_data") ?? ""
//       : "";
//   Map<String, dynamic> onlineDropdownItems =
//       jsonDecode(data) as Map<String, dynamic>;
//   DashboardResponse dropdownsResponse =
//       DashboardResponse.fromJson(onlineDropdownItems);
//   return dropdownsResponse;
// }

// void setDashboardData(DashboardResponse data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('dashboard_data', jsonEncode(data));
// }

// //Function for getting impotters in Shared Preference
// Future<List<Importers>> getImporterData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final data = prefs.getString("importers") ?? "";
//   List<Importers> importers = [];
//   importers = <Importers>[];
//   jsonDecode(data).forEach((v) {
//     importers.add(Importers.fromJson(v));
//   });
//   return importers;
// }

// void setImporterData(List<Importers> data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString(
//       'importers', jsonEncode(data.map((v) => v.toJson()).toList()));
// }

//Function for getting qr codes in Shared Preference
Future<List<String>> getUsedQRCodes() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getString("used_qr_codes") ?? "[]";
  return jsonDecode(data).cast<String>();
}

void setUsedQRCodes(List<String> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('used_qr_codes', jsonEncode(data));
}

Future<List<String>> getUsedLocalQRCodes() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getString("local_used_qr_codes") ?? "[]";
  return jsonDecode(data).cast<String>();
}

void setUsedLocalQRCodes(List<String> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('local_used_qr_codes', jsonEncode(data));
}

// Function for getting device token in Shared Preference
Future<String> getDeviceToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.containsKey("deviceToken")
      ? (prefs.getString("deviceToken") ?? "")
      : "";
  return token;
}

// Function for setting device token in Shared Preference
void setDeviceToken(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('deviceToken', data);
  //Function for getting and stroe notifications in Shared Preference

// Future<NotificationData> getNotificationData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString("notifications") ?? "{\"notifications\":[]}";
//      Map<String, dynamic> userMap = jsonDecode(data) as Map<String, dynamic> ;
//     NotificationData notification =  NotificationData.fromJson(userMap);
//     return notification ;
//   }

//   void setNotificationData(NotificationData data) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('notifications', jsonEncode(data));
//   }
}

//Function for set and  getting Laguage in Shared Preference
// Future<LaguagesModel> getLaguage() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final data = prefs.getString("laguage") ?? "";
//   Map<String, dynamic> laguage;
//   LaguagesModel laguagesModel;
//   if (data != "") {
//     laguage = jsonDecode(data) as Map<String, dynamic>;
//     laguagesModel = LaguagesModel.fromJson(laguage);
//   } else {
//     laguagesModel = LaguagesModel();
//   }

//   return laguagesModel;
// }

// void setLaguage(LaguagesModel data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString("laguage", jsonEncode(data));
// }
