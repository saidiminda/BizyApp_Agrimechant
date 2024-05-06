class ResetPasswordRequest {
  String? imeiNumber;
  String? appVersionName;
  String? date;
  String? time;
  int? userId;
  int? userableId;
  int? outletId;

  ResetPasswordRequest(
      {this.imeiNumber,
      this.appVersionName,
      this.date,
      this.time,
      this.userId,
      this.userableId,
      this.outletId});

  ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    imeiNumber = json['imei_number'];
    appVersionName = json['app_version_name'];
    date = json['date'];
    time = json['time'];
    userId = json['user_id'];
    userableId = json['userable_id'];
    outletId = json['outlet_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imei_number'] = imeiNumber;
    data['app_version_name'] = appVersionName;
    data['date'] = date;
    data['time'] = time;
    data['user_id'] = userId;
    data['userable_id'] = userableId;
    data['outlet_id'] = outletId;
    return data;
  }
}
