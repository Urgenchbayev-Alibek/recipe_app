import 'package:equatable/equatable.dart';

abstract class TopChefEvent extends Equatable {
  const TopChefEvent();

  @override
  List<Object> get props => [];
}

class FetchChefProfile extends TopChefEvent {
  final int chefId;

  const FetchChefProfile(this.chefId);

  @override
  List<Object> get props => [chefId];
}

class FetchChefRecipes extends TopChefEvent {
  final int chefId;

  const FetchChefRecipes(this.chefId);

  @override
  List<Object> get props => [chefId];
}

class FollowChef extends TopChefEvent {
  final int chefId;

  const FollowChef(this.chefId);

  @override
  List<Object> get props => [chefId];
}

class UnfollowChef extends TopChefEvent {
  final int chefId;

  const UnfollowChef(this.chefId);

  @override
  List<Object> get props => [chefId];
}
