import 'package:flutter/cupertino.dart';
import 'package:recipe_app/core/data/models/top_chef_model_small.dart';
import 'package:recipe_app/core/data/repositories/top_chef_repository.dart';
import 'package:recipe_app/features/categories/data/repositories/categories_repository.dart';
import '../../../categories/data/models/categories_model.dart';
import '../../../category_detail/data/models/recipe_model.dart';
import '../../../category_detail/data/repositories/recipe_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required CategoryRepository catsRepo,
    required RecipeRepository recipeRepo,
    required TopChefRepository topChefRepo,
  })  : _catsRepo = catsRepo,
        _recipeRepo = recipeRepo,
        _topChefRepo = topChefRepo {
    load();
  }

  bool isLoading = true;

  final CategoryRepository _catsRepo;
  final RecipeRepository _recipeRepo;
  final TopChefRepository _topChefRepo;

  CategoryModel? selected;
  List<CategoryModel> categories = [];
  List<RecipeModel> yourRecipes = [];
  List<RecipeModel> recentRecipes = [];

  RecipeModel? trendingRecipe;
  List<TopChefModelSmall> topChefsHome = [];

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    categories = await _catsRepo.fetchCategories();
    trendingRecipe = await _recipeRepo.fetchTrendingRecipe();
    yourRecipes = await _recipeRepo.fetchYourRecipes(2);
    topChefsHome = await _topChefRepo.fetchTopChefs(4);
    recentRecipes = await _recipeRepo.fetchRecentRecipes(2);
    selected = categories.firstOrNull;
    isLoading = false;
    notifyListeners();
  }
}
