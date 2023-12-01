class GetFarmerRequest {
  String? farmerNumber;

  GetFarmerRequest({this.farmerNumber});

  GetFarmerRequest.fromJson(Map<String, dynamic> json) {
    farmerNumber = json['farmer_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['farmer_number'] = farmerNumber;
    return data;
  }
}
