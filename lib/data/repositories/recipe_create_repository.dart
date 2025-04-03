import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/data/models/recipe/ingredient_model.dart';
import 'package:recipe_app/data/models/recipe/instructions_model.dart';

import '../models/recipe_create_model.dart';

class RecipeCreateRepository {
  final ApiClient client;

  RecipeCreateRepository({required this.client});

  Future<bool> recipeCreate({
    required int categoryId,
    required String title,
    required String description,
    required String difficulty,
    required int timeRequired,
    required List<InstructionModel> instructions,
    required List<IngredientModel> ingredients,
  }) async {
    final recipeModel = RecipeCreateModel(
      categoryId: categoryId,
      title: title,
      description: description,
      difficulty: difficulty,
      timeRequired: timeRequired,
      instructions: instructions,
      ingredients: ingredients,
    );
    final result = await client.recipeCreate(recipeModel);
    return result;
  }
}
