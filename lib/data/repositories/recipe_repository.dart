import '../models/recipe_model.dart';
import '../../../features/community/data/models/community_model.dart';
import '../../../features/recipe_detail/data/models/recipe_detail_model.dart';
import '../../core/client.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;
  List<RecipeModel> recipes = [];
  List<CommunityRecipeModel> communityRecipes = [];
  Map<int, List<RecipeModel>> recipesByCategory = {};
  RecipeDetailModel? recipe;

  List<RecipeModel> recentlyAddedRecipes = [];

  RecipeModel? trendingRecipe;

  Future<RecipeModel?> fetchTrendingRecipe() async {
    var rawRecipe = await client.fetchTrendingRecipe();
    trendingRecipe = RecipeModel.fromJson(rawRecipe);
    return trendingRecipe;
  }

  Future<List<RecipeModel>> fetchYourRecipes({int? limit}) async {
    var rawRecipes = await client.fetchYourRecipes(limit:limit);
    return rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
  }

  Future<List<RecipeModel>> fetchRecipesByCategory(int categoryId) async {
    if (recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null) {
      return recipesByCategory[categoryId]!;
    }

    var rawRecipes = await client.fetchRecipesByCategory(categoryId);
    final recipes = rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<List<RecipeModel>> fetchRecipes() async {
    List<dynamic> recipesRaw = await client.fetchRecipes();
    recipes = recipesRaw.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    return recipes;
  }

  Future<RecipeDetailModel> fetchRecipeById(int recipeId) async {
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe!;
  }

  Future<List<RecipeModel>> fetchRecentlyAddedRecipes({int? limit}) async {
    var rawRecipes = await client.fetchRecentlyAddedRecipes(limit: limit);
    recentlyAddedRecipes = rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    return recentlyAddedRecipes;
  }

  Future<List<CommunityRecipeModel>> fetchCommunityRecipes(int limit, String order, bool descending) async {
    var rawCommunity = await client.fetchCommunityRecipes(limit, order, descending);
    communityRecipes = rawCommunity.map((community) => CommunityRecipeModel.fromJson(community)).toList();
    return communityRecipes;
  }
}
