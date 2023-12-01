class VerfyQrCodeRequest {
  int? userableId;
  String? qrCode;

  VerfyQrCodeRequest({this.userableId, this.qrCode});

  VerfyQrCodeRequest.fromJson(Map<String, dynamic> json) {
    userableId = json['userable_id'];
    qrCode = json['qr_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userable_id'] = userableId;
    data['qr_code'] = qrCode;
    return data;
  }
}
