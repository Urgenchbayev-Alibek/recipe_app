import 'package:equatable/equatable.dart';

abstract class TopChefProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTopChefProfile extends TopChefProfileEvent {
  final int chefId;

  LoadTopChefProfile(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
