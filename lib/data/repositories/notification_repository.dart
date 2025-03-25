import '../../core/client.dart';
import '../models/notifications_model.dart';

class NotificationRepository{
  final ApiClient client;
  NotificationRepository({required this.client});

  List<NotificationModel>? notification=[];

  Future<List<NotificationModel>>fetchNotifications()async{
    var rawNotification=await client.genericGetRequest<List<dynamic>>('/notifications/list');
    notification=rawNotification.map((e)=>NotificationModel.fromJson(e)).toList();
    return notification!;
  }

}