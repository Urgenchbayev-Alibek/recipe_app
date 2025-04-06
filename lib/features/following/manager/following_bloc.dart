part of 'following_event.dart';

class FollowingBloc extends Bloc<FollowEvent, FollowState> {
  final ProfileRepository _repo;

  FollowingBloc({
    required ProfileRepository repo,
  })  : _repo = repo,
        super(FollowState.initial()) {
    on<FollowLoad>(_load);
    on<FollowUser>(_followUser);
    on<UnfollowUser>(_unFollowUser);
    on<DeleteUser>(_removeUser);
  }

  Future<void> _load(FollowLoad event, Emitter<FollowState> emit) async {
    emit(state.copyWith(followStatus: FollowStatus.loading, followingStatus: FollowStatus.loading));
    final followers = await _repo.fetchFollowers(event.id);
    emit(state.copyWith(follower: followers, followStatus: FollowStatus.success));
    final followings = await _repo.fetchFollowings(event.id);
    emit(state.copyWith(followings: followings, followingStatus: FollowStatus.success));
  }

  Future<void> _followUser(FollowUser event, Emitter<FollowState> emit) async {
    emit(state.copyWith(followUserStatus: FollowStatus.loading));
    int userId = await _repo.fetchFollowUser(event.userId);
    emit(state.copyWith(followUser: userId, followUserStatus: FollowStatus.success));
  }

  Future<void> _unFollowUser(UnfollowUser event, Emitter<FollowState> emit) async {
    emit(state.copyWith(unFollowUserStatus: FollowStatus.loading));
    int userId = await _repo.fetchUnFollowUser(event.userId);
    emit(state.copyWith(unFollowUser: userId, unFollowUserStatus: FollowStatus.success));
  }

  Future<void> _removeUser(DeleteUser event, Emitter<FollowState> emit) async {
    emit(state.copyWith(deleteUserStatus: FollowStatus.loading));
    int userId = await _repo.fetchDeleteUser(event.userId);
    emit(state.copyWith(deleteUser: userId, deleteUserStatus: FollowStatus.success));
  }
}
