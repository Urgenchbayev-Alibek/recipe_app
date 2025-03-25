import 'package:recipe_app/core/client.dart';
import '../models/notifications_model.dart';

class NotificationRepository {
  final ApiClient client;

  NotificationRepository(this.client);

  Future<List<NotificationModel>> fetchTodayNotifications() async {
    try {
      final data = await client.genericGetRequest<List<dynamic>>("/notifications/today");
      return data.map((json) => NotificationModel(
        title: json['title'],
        message: json['message'],
        time: json['time'],
        date: json['date'] ?? '',
      )).toList();
    } catch (e) {
      throw Exception("Failed to fetch today's notifications");
    }
  }

  Future<List<NotificationModel>> fetchPastNotifications() async {
    try {
      final data = await client.genericGetRequest<List<dynamic>>("/notifications/past");
      return data.map((json) => NotificationModel(
        title: json['title'],
        message: json['message'],
        time: json['time'],
        date: json['date'] ?? '',
      )).toList();
    } catch (e) {
      throw Exception("Failed to fetch past notifications");
    }
  }
}
