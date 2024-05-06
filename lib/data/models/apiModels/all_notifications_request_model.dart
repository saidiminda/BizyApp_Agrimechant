class AllNotificationsRequest {
  int? userId;

  AllNotificationsRequest({this.userId});

  AllNotificationsRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    return data;
  }
}
