import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/profile_repository.dart';
import 'following_state.dart';

part 'following_bloc.dart';

sealed class FollowEvent{}

final class FollowLoad extends FollowEvent{
  final int id;
  FollowLoad({required this.id});
}
final class FollowUser extends FollowEvent{
  final int userId;
  FollowUser({required this.userId});
}

final class DeleteUser extends FollowEvent{
  final int userId;
  DeleteUser({required this.userId});
}

final class UnfollowUser extends FollowEvent{
  final int userId;
  UnfollowUser({required this.userId});
}