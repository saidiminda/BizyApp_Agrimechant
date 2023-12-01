class RequestOtpCodeRequest {
  String? name;
  String? memberId;
  String? phoneNumber;
  String? entityId;
  String? userId;

  RequestOtpCodeRequest(
      {this.name, this.memberId, this.phoneNumber, this.entityId, this.userId});

  RequestOtpCodeRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    memberId = json['member_id'];
    phoneNumber = json['phone_number'];
    entityId = json['entity_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['member_id'] = memberId;
    data['phone_number'] = phoneNumber;
    data['entity_id'] = entityId;
    data['user_id'] = userId;
    return data;
  }
}
