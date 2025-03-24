import 'package:equatable/equatable.dart';

class TopChefProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopChefProfileLoading extends TopChefProfileState {}

class TopChefProfileLoaded extends TopChefProfileState {
  final String firstName;
  final String photo;

  TopChefProfileLoaded({
    required this.firstName,
    required this.photo,
  });

  @override
  List<Object?> get props => [firstName, photo];
}

class TopChefProfileError extends TopChefProfileState {
  final String message;

  TopChefProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
