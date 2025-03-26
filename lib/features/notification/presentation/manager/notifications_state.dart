import 'package:equatable/equatable.dart';
import '../../../../data/models/notifications_model.dart';

enum NotificationsStatus { idle, success, loading, error }

class NotificationsState extends Equatable {
  final List<NotificationsModel>? notification;
  final NotificationsStatus notificationStatus;

  const NotificationsState({
    required this.notification,
    required this.notificationStatus,
  });

  factory NotificationsState.initial() {
    return NotificationsState(
      notification: [],
      notificationStatus: NotificationsStatus.idle,
    );
  }

  NotificationsState copyWith({List<NotificationsModel>? notifications, NotificationsStatus? status}) {
    return NotificationsState(
      notification: notifications ?? notification,
      notificationStatus: status ?? notificationStatus,
    );
  }

  @override
  List<Object?> get props => [notification,notificationStatus];
}