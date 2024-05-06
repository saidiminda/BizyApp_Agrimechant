import 'single_notification_response_model.dart';

class AllNotificationsResponse {
  List<SingleNotificationResponse>? notifications;

  AllNotificationsResponse({this.notifications});

  AllNotificationsResponse.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <SingleNotificationResponse>[];
      json['notifications'].forEach((v) {
        notifications?.add(SingleNotificationResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (notifications != null) {
      data['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Notifications {
//   int? id;
//   String? title;
//   String? message;
//   String? date;
//   String? time;
//   int? status;

//   Notifications(
//       {this.id, this.title, this.message, this.date, this.time, this.status});

//   Notifications.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     message = json['message'];
//     date = json['date'];
//     time = json['time'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['message'] = message;
//     data['date'] = date;
//     data['time'] = time;
//     data['status'] = status;
//     return data;
//   }
// }
