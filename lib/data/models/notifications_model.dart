class NotificationModel {
  final int id;
  final String title, subtitle;
  final DateTime date;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.id,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      subtitle: json['subtitle'],
      id: json['id'],
      date: DateTime.parse(json['date']),
    );
  }
}