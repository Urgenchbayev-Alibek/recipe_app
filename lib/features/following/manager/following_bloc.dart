// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../data/models/following_model/following_model.dart';
// import '../../../data/repositories/following_repository.dart';
// import 'following_event.dart';
// import 'following_state.dart';
//
// class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
//   final FollowingRepository repository;
//
//   FollowingBloc({required FollowingRepository repository})
//   :_repository=repository
//   {
//     on<LoadFollowing>((event, emit) async {
//       emit(FollowingLoading());
//       try {
//         final users = await repository.fetchFollowingUsers();
//         emit(FollowingLoaded(users));
//       } catch (_) {
//         emit(FollowingError());
//       }
//     });
//   }
// }
