class SingleNotificationResponse {
  int? id;
  String? title;
  String? message;
  String? date;
  String? time;
  int? status;

  SingleNotificationResponse(
      {this.id, this.title, this.message, this.date, this.time, this.status});

  SingleNotificationResponse.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    title = json['title'];
    message = json['message'];
    date = json['date'];
    time = json['time'];
    status = int.parse(json['status'].toString());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['message'] = message;
    data['date'] = date;
    data['time'] = time;
    data['status'] = status;
    return data;
  }
}
