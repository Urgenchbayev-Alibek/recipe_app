import 'package:equatable/equatable.dart';
import '../../../data/models/top_chef_model.dart';

enum FollowStatus { idle, success, loading, error }

class FollowState extends Equatable {
  final List<TopChefModel>? followers;
  final List<TopChefModel>? followings;

  final FollowStatus? followStatus;
  final FollowStatus? followingStatus;
  final FollowStatus? followUserStatus;
  final FollowStatus? deleteUserStatus;
  final FollowStatus? unFollowUserStatus;

  final int followUser;
  final int deleteUser;
  final int unFollowUser;

  const FollowState({
    required this.followers,
    required this.followings,
    required this.followStatus,
    required this.followingStatus,
    required this.followUser,
    required this.followUserStatus,
    required this.deleteUser,
    required this.unFollowUser,
    required this.unFollowUserStatus,
    required this.deleteUserStatus,
  });

  factory FollowState.initial() {
    return FollowState(
      followers: [],
      followings: [],
      followUser: 0,
      deleteUser: 0,
      unFollowUser: 0,
      followStatus: FollowStatus.loading,
      followingStatus: FollowStatus.loading,
      followUserStatus: FollowStatus.idle,
      unFollowUserStatus: FollowStatus.idle,
      deleteUserStatus: FollowStatus.idle,
    );
  }

  FollowState copyWith({
    List<TopChefModel>? follower,
    List<TopChefModel>? followings,
    FollowStatus? followStatus,
    FollowStatus? followingStatus,
    FollowStatus? followUserStatus,
    FollowStatus? unFollowUserStatus,
    FollowStatus? deleteUserStatus,
    int? followUser,
    int? deleteUser,
    int? unFollowUser,
  }) {
    return FollowState(
      followers: follower ?? this.followers,
      followings: followings ?? this.followings,
      followStatus: followStatus ?? this.followStatus,
      followingStatus: followingStatus ?? this.followingStatus,
      followUser: followUser ?? this.followUser,
      followUserStatus: followUserStatus ?? this.followUserStatus,
      deleteUser: deleteUser ?? this.deleteUser,
      unFollowUser: unFollowUser ?? this.unFollowUser,
      deleteUserStatus: deleteUserStatus ?? this.deleteUserStatus,
      unFollowUserStatus: unFollowUserStatus ?? this.unFollowUserStatus,
    );
  }

  @override
  List<Object?> get props => [
        followStatus,
        followers,
        followings,
        followingStatus,
        followUser,
        followUserStatus,
        unFollowUser,
        unFollowUserStatus,
        deleteUserStatus,
        deleteUser,
      ];
}
