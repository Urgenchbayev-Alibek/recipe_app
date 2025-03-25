import 'package:equatable/equatable.dart';

import '../../../../data/models/notifications_model.dart';


enum NotificationsStatus { idle, loading, success, error }

class NotificationsState extends Equatable {
  final List<NotificationModel> todayNotifications;
  final List<NotificationModel> pastNotifications;
  final NotificationsStatus status;

  const NotificationsState({
    required this.todayNotifications,
    required this.pastNotifications,
    required this.status,
  });

  factory NotificationsState.initial() {
    return NotificationsState(
      todayNotifications: [],
      pastNotifications: [],
      status: NotificationsStatus.idle,
    );
  }

  NotificationsState copyWith({
    List<NotificationModel>? todayNotifications,
    List<NotificationModel>? pastNotifications,
    NotificationsStatus? status,
  }) {
    return NotificationsState(
      todayNotifications: todayNotifications ?? this.todayNotifications,
      pastNotifications: pastNotifications ?? this.pastNotifications,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [todayNotifications, pastNotifications, status];
}