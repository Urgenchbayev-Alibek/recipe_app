import '../../../data/models/following_model/following_model.dart';

abstract class FollowingState {}
class FollowingInitial extends FollowingState {}
class FollowingLoading extends FollowingState {}
class FollowingLoaded extends FollowingState {
  final List<FollowingModel> users;
  FollowingLoaded(this.users);
}
class FollowingError extends FollowingState {}
