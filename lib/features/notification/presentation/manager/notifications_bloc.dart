import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repositories/notification_repository.dart';
import 'notifications_state.dart';
part 'notifications_event.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationRepository _repo;

  NotificationsBloc({required NotificationRepository repo})
      : _repo = repo,
        super(NotificationsState.initial()) {
    on<NotificationsLoad>(_onLoad);
    add(NotificationsLoad());
  }

  Future<void> _onLoad(NotificationsLoad event, Emitter<NotificationsState> emit) async {
    emit( state.copyWith(status: NotificationsStatus.loading));
    final notification = await _repo.fetchNotifications();
    emit(state.copyWith(notifications: notification, status: NotificationsStatus.success));
  }
}
