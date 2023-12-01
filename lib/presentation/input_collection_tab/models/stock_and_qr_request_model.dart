class StockAndQrRequest {
  int? userId;

  StockAndQrRequest({this.userId});

  StockAndQrRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    return data;
  }
}
