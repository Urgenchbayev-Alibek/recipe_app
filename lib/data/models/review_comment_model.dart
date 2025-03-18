import 'package:recipe_app/data/models/user_model_small.dart';

class ReviewCommentModel {
  final int id;
  final num rating;
  final String comment, image;
  final DateTime created;
  final UserModelInRecipe user;

  ReviewCommentModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.image,
    required this.created,
    required this.user,
  });

  factory ReviewCommentModel.fromJson(Map<String, dynamic> json) {
    return ReviewCommentModel(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      image: json['image'],
      created:DateTime.parse(json['created']),
      user: UserModelInRecipe.fromJson(json['user']),
    );
  }
}
