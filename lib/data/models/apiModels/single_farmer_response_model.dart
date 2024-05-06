import 'register_farmer_request_model.dart';

class SingleFarmerResponse {
  Farmers? farmer;

  SingleFarmerResponse({this.farmer});

  SingleFarmerResponse.fromJson(Map<String, dynamic> json) {
    farmer = json['farmer'] != null ? Farmers?.fromJson(json['farmer']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (farmer != null) {
      data['farmer'] = farmer?.toJson();
    }
    return data;
  }
}