import 'package:recipe_app/data/models/ingredient_model.dart';
import 'package:recipe_app/data/models/instructions_model.dart';
import 'package:recipe_app/data/models/user_model_small.dart';

class RecipeDetailModel {
  final int id;
  final int categoryId;
  final String title, description;
  final String image, videoRecipe;

  final int timeRequired, rating;

  final UserModelInRecipe user;


  List<Instruction> instructions;
  List<Ingredient> ingredients;

  RecipeDetailModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.image,
    required this.videoRecipe,
    required this.timeRequired,
    required this.rating,
    required this.user,
    required this.instructions,
    required this.ingredients
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      image: json['photo'],
      videoRecipe: json['videoRecipe'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      user: json['user'],
      instructions: (json['instructions'] as List<dynamic>).map((e)=> Instruction.fromJson(e)).toList(),
      ingredients: (json['ingredients'] as List<dynamic>).map((e)=> Ingredient.fromJson(e)).toList(),

    );
  }
}
