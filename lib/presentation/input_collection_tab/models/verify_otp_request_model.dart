class VerifyOtpRequest {
  String? otpCode;
  String? memberId;
  String? phoneNumber;
  String? entityId;
  String? userId;

  VerifyOtpRequest(
      {this.otpCode,
      this.memberId,
      this.phoneNumber,
      this.entityId,
      this.userId});

  VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    otpCode = json['otp_code'];
    memberId = json['member_id'];
    phoneNumber = json['phone_number'];
    entityId = json['entity_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['otp_code'] = otpCode;
    data['member_id'] = memberId;
    data['phone_number'] = phoneNumber;
    data['entity_id'] = entityId;
    data['user_id'] = userId;
    return data;
  }
}
