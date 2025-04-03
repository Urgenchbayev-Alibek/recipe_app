import 'package:recipe_app/data/models/recipe/ingredient_model.dart';
import 'package:recipe_app/data/models/recipe/instructions_model.dart';

class RecipeCreateModel {
  final int categoryId;
  final String title;
  final String description;
  final String difficulty;
  final int timeRequired;
  final List<InstructionModel> instructions;
  final List<IngredientModel> ingredients;

  RecipeCreateModel({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.timeRequired,
    required this.instructions,
    required this.ingredients,
  });

  factory RecipeCreateModel.fromJson(Map<String, dynamic> json) {
    return RecipeCreateModel(
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      difficulty: json['difficulty'],
      timeRequired: json['timeRequired'],
      instructions: (json['instructions'] as List).map((i) => InstructionModel.fromJson(i)).toList(),
      ingredients: (json['ingredients'] as List).map((i) => IngredientModel.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'timeRequired': timeRequired,
      'instructions': instructions.map((i) => i.toJson()).toList(),
      'ingredients': ingredients.map((i) => i.toJson()).toList(),
    };
  }
}
