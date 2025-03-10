import 'package:flutter/cupertino.dart';
import '../../../../data/repositories/recipe_repository.dart';
import '../../../profile/data/models/recipes_model.dart';


class RecipeViewModel extends ChangeNotifier {
  RecipeViewModel({required RecipeRepository recipeRepo})
      : _recipeRepo = recipeRepo {
    load();
  }

  final RecipeRepository _recipeRepo;
  List<RecipeModel>? myRecipe;

  Future<void> load() async {
    myRecipe = (await _recipeRepo.fetchRecipes()).cast<RecipeModel>();
    notifyListeners();
  }
}
