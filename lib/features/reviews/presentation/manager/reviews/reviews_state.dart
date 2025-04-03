import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/data/models/recipe/review_model.dart';
import 'package:recipe_app/data/models/recipe/reviews_recipe_model.dart';
import 'package:recipe_app/data/models/review_model/review_comment_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final ReviewsRecipeModel? recipeModel;
  final List<ReviewModel> reviews;
  final List<ReviewCommentModel> comments;

  const ReviewsState({required this.recipeModel, required this.status, required this.reviews, required this.comments});

  ReviewsState copyWith({
    ReviewsRecipeModel? recipeModel,
    ReviewsStatus? status,
    List<ReviewModel>? reviews,
  }) {
    return ReviewsState(
      recipeModel: recipeModel ?? this.recipeModel,
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
      comments: comments ?? [],
    );
  }

  factory ReviewsState.initialize() {
    return ReviewsState(recipeModel: null, status: ReviewsStatus.loading, comments: [], reviews: []);
  }

  @override
  List<Object?> get props => [recipeModel, reviews, status];
}
