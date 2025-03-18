import 'package:recipe_app/data/models/review_model/review_user_model.dart';
import 'package:recipe_app/data/models/user_model_small.dart';

class ReviewsRecipeModel {
  final int id;
  final String title;
  final String image;
  final double rating;
  final int reviewsCount;
  final ReviewerUserModel user;

  ReviewsRecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory ReviewsRecipeModel.fromJson(Map<String, dynamic> json) {
    return ReviewsRecipeModel(
      id: json['id'],
      title: json['title'],
      image: json['photo'],
      rating: json['rating'].toDouble(),
      reviewsCount: json['reviewsCount'],
      user: ReviewerUserModel.fromJson(json['user']),
    );
  }
}
