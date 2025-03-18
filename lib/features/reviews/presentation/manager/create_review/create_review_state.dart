import 'dart:io';

import 'package:equatable/equatable.dart';

enum CreateReviewStatus { idle, loading, error }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;
  final File? pickedImage;

  const CreateReviewState({required this.recipeId, required this.currentIndex, required this.status, required this.pickedImage});

  factory CreateReviewState.initial() {
    return CreateReviewState(
      recipeId: null,
      currentIndex: null,
      status: CreateReviewStatus.loading,
      pickedImage: null,
    );
  }

  CreateReviewState copyWith({
    int? recipeId,
    int? currentIndex,
    CreateReviewStatus? status,
  }) {
    return CreateReviewState(
      recipeId: recipeId ?? this.recipeId,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
      pickedImage: pickedImage ?? pickedImage,
    );
  }

  @override
  List<Object?> get props => [recipeId, currentIndex, status];
}
