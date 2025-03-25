import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repositories/notification_repository.dart';
import 'notifications_state.dart';
part 'notifications_event.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationRepository _notificationRepo;

  NotificationsBloc({required NotificationRepository notificationRepo})
      : _notificationRepo = notificationRepo,
        super(NotificationsState.initial()) {
    on<LoadNotifications>(_onLoad);
    add(LoadNotifications());
  }

  Future<void> _onLoad(
      LoadNotifications event, Emitter<NotificationsState> emit) async {
    emit(state.copyWith(status: NotificationsStatus.loading));

    try {
      final todayNotifications = await _notificationRepo.fetchTodayNotifications();
      final pastNotifications = await _notificationRepo.fetchPastNotifications();

      emit(state.copyWith(
        todayNotifications: todayNotifications,
        pastNotifications: pastNotifications,
        status: NotificationsStatus.success,
      ));
    } catch (error) {
      emit(state.copyWith(status: NotificationsStatus.error));
    }
  }
}
