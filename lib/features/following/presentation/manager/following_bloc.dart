// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../data/repositories/following_repository.dart';
// import 'following_event.dart';
// import 'following_state.dart';
//
// class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
//   final UserRepository _repo;
//
//   FollowingBloc({required UserRepository repo})
//       : _repo = repo,
//         super(FollowingInitial()) {
//     on<LoadFollowing>(_onLoad);
//     add(LoadFollowing());
//   }
//
//   Future<void> _onLoad(LoadFollowing event, Emitter<FollowingState> emit) async {
//     emit(FollowingLoading());
//     try {
//       final users = await _repo.fetchFollowingUsers();
//       emit(FollowingLoaded(users));
//     } catch (_) {
//       emit(FollowingError());
//     }
//   }
// }
