import '../../../../../data/models/top_chef_profile_model.dart';

abstract class TopChefProfileState {}

class TopChefProfileInitial extends TopChefProfileState {}

class TopChefProfileLoading extends TopChefProfileState {}

class TopChefProfileLoaded extends TopChefProfileState {
  final TopChefProfile chef;
  TopChefProfileLoaded(this.chef);
}

class TopChefProfileError extends TopChefProfileState {
  final String message;
  TopChefProfileError(this.message);
}
