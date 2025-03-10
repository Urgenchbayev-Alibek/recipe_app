import 'package:recipe_app/features/recipe_detail/data/models/user_model_small.dart';

class CommunityModel {
  int id;
  String title, description, created, photo;
  num timeRequired, rating, reviewsCount;
  final UserModelInRecipe user;

  CommunityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.created,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      created: json['created'],
      photo: json['photo'],
      timeRequired: json['timeRequired'] ?? 0,
      rating: json['rating'] ?? 0,
      reviewsCount: json['reviewsCount'] ?? 0,
      user: UserModelInRecipe.fromJson(json['user']),
    );
  }
}
