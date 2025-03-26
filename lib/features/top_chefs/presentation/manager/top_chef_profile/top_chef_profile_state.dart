import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/top_chef_profile_model.dart';

abstract class TopChefState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopChefInitial extends TopChefState {}

class TopChefLoading extends TopChefState {}

class TopChefLoaded extends TopChefState {
  final List<TopChefProfileModel> chefs;

  TopChefLoaded(this.chefs);

  @override
  List<Object> get props => [chefs];
}

class TopChefError extends TopChefState {
  final String message;

  TopChefError(this.message);

  @override
  List<Object> get props => [message];
}
