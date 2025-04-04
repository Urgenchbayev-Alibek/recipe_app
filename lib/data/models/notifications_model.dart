class NotificationsModel {
  final int id;
  final String title, subtitle;
  final DateTime date;

  NotificationsModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      date: DateTime.parse(json['date']),
    );
  }
}
