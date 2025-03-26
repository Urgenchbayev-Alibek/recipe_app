import 'package:equatable/equatable.dart';

abstract class TopChefEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTopChefs extends TopChefEvent {}
