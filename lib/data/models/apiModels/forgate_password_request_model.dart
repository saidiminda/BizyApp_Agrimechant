class ForgatePasswordRequest {
  String? username;

  ForgatePasswordRequest({this.username});

  ForgatePasswordRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    return data;
  }
}
