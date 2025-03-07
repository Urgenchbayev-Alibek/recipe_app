import 'package:flutter/cupertino.dart';
import '../../../categories/data/models/categories_model.dart';
import '../../../categories/data/repositories/categories_repository.dart';
import '../../../category_detail/data/models/recipe_model.dart';
import '../../../category_detail/data/repositories/recipe_repository.dart';


class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required CategoryRepository catsRepo, required RecipeRepository recipeRepo})
      : _catsRepo = catsRepo,
        _recipeRepo = recipeRepo {
    load();
  }

  bool isLoading = true;
  // final CategoryModel selected;
  // , required this.selected


  final CategoryRepository _catsRepo;
  final RecipeRepository _recipeRepo;

  List<RecipeModel> yourRecipes = [];
  List<CategoryModel> categories = [];

  RecipeModel? trendingRecipe;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    categories = await _catsRepo.fetchCategories();
    trendingRecipe = await _recipeRepo.fetchTrendingRecipe();
    yourRecipes = await _recipeRepo.fetchYourRecipes();

    isLoading = false;
    notifyListeners();
  }
}
