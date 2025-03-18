import 'package:flutter/material.dart';
import '../../../../data/models/recipe_detail_model.dart';
import '../../../../data/repositories/recipe_repository.dart';


class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel({
    required RecipeRepository recipeRepo,
    required this.recipeId,
  }) : _recipeRepo = recipeRepo {
    load();
  }

  final RecipeRepository _recipeRepo;
  bool isLoading = true;
  final int recipeId;

  late final RecipeDetailModel recipe;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    recipe = await _recipeRepo.fetchRecipeById(recipeId);
    isLoading = false;
    notifyListeners();
  }
}
