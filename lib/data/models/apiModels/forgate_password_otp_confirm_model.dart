class ForgatePasswordOtpConfirm {
  String? otp;

  ForgatePasswordOtpConfirm({this.otp});

  ForgatePasswordOtpConfirm.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['otp'] = otp;
    return data;
  }
}
