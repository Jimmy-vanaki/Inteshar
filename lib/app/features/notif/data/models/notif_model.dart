class NotificationsModel {
  String? status;
  List<NotificationItem>? notifications;

  NotificationsModel({this.status, this.notifications});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      status: json['status'],
      notifications: json['notifications'] != null
          ? (json['notifications'] as List)
              .map((item) => NotificationItem.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'notifications': notifications?.map((item) => item.toJson()).toList(),
    };
  }
}

class NotificationItem {
  int? id;
  String? title;
  int? dateTime;
  String? dateFormat;

  NotificationItem({this.id, this.title, this.dateTime, this.dateFormat});

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      title: json['title'],
      dateTime: json['date_time'],
      dateFormat: json['date_format'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date_time': dateTime,
      'date_format': dateFormat,
    };
  }
}
