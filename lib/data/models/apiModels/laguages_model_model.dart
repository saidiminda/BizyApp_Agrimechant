import 'package:get/get.dart';

class LaguagesModel {
  String? languageName = "sw".tr;
  String? languageCode = "sw";
  String? countryCode = "TZ";

  LaguagesModel({this.languageName, this.languageCode, this.countryCode});

  LaguagesModel.fromJson(Map<String, dynamic> json) {
    languageName = json['language_name'];
    languageCode = json['language_code'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['language_name'] = languageName;
    data['language_code'] = languageCode;
    data['country_code'] = countryCode;
    return data;
  }
}
