class ChangePasswordRequest {
  int? userId;
  String? oldPassword;
  String? newPassword;
  String? imeiNumber;
  String? appVersionName;
  String? date;
  String? time;

  ChangePasswordRequest(
      {this.userId,
      this.oldPassword,
      this.newPassword,
      this.imeiNumber,
      this.appVersionName,
      this.date,
      this.time});

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    oldPassword = json['old_password'];
    newPassword = json['new_password'];
    imeiNumber = json['imei_number'];
    appVersionName = json['app_version_name'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    data['imei_number'] = imeiNumber;
    data['app_version_name'] = appVersionName;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
