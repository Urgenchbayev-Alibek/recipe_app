import 'package:recipe_app/data/models/trending_recipe/trending_recipe_model.dart';

import '../../core/client.dart';
import '../models/recipe/community_recipe_model.dart';
import '../models/recipe/recipe_create_review_model.dart';
import '../models/recipe/recipe_detail_model.dart';
import '../models/recipe/recipe_model.dart';
import '../models/recipe/reviews_recipe_model.dart';
import '../models/review_model/review_comment_model.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;
  List<RecipeModel> recipes = [];
  List<CommunityRecipeModel> communityRecipes = [];
  List<RecipeModel> recentlyAddedRecipes = [];
  List<ReviewCommentModel> comments = [];
  Map<int, List<RecipeModel>> recipesByCategory = {};
  RecipeDetailModel? recipe;
  ReviewsRecipeModel? reviewsRecipe;
  RecipeModel? trendingRecipe;

  TrendingRecipeModel? trendingRecipeMain;

  Future<RecipeModel?> fetchTrendingRecipe() async {
    var rawRecipe = await client.fetchTrendingRecipe();
    trendingRecipe = RecipeModel.fromJson(rawRecipe);
    return trendingRecipe;
  }

  Future<List<RecipeModel>> fetchYourRecipes({int? limit}) async {
    var rawRecipes = await client.fetchYourRecipes(limit: limit);
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

  Future<List<CommunityRecipeModel>> fetchCommunityRecipes({required String orderBy, required bool descending}) async {
    final rawRecipes = await client.fetchCommunityRecipes(orderBy: orderBy, descending: descending);
    communityRecipes = rawRecipes.map((recipe) => CommunityRecipeModel.fromJson(recipe)).toList();
    return communityRecipes;
  }

  Future<ReviewsRecipeModel> fetchRecipeForReviews(int recipeId) async {
    var rawRecipe = await client.fetchRecipeForReviews(recipeId);
    reviewsRecipe = ReviewsRecipeModel.fromJson(rawRecipe);
    return reviewsRecipe!;
  }

  Future<RecipeCreateReviewModel> fetchRecipeForCreateReview(int recipeId) async {
    var rawRecipe = await client.genericGetRequest<dynamic>('/recipes/create-review/$recipeId');
    return RecipeCreateReviewModel.fromJson(rawRecipe);
  }

  Future<List<ReviewCommentModel>> fetchComments(int recipeId) async {
    var rawComments = await client.fetchRecipeComments(recipeId);
    comments = rawComments.map((e) => ReviewCommentModel.fromJson(e)).toList();
    return comments;
  }
  
  Future<TrendingRecipeModel> fetchTrendingRecipeMain() async{
    var rawRecipe= await client.genericGetRequest<dynamic>('/recipes/trending-recipe');
    trendingRecipeMain =rawRecipe.map((e)=>TrendingRecipeModel.fromJson(e));
    return trendingRecipeMain!;
  }

  // Future<TrendingRecipeModel> fetchTrendingRecipes() async {
  //   var rawRecipes = await client.genericGetRequest<List<dynamic>>(
  //     '/recipes/trending-recipes/list',
  //   );
  //   trendingRecipeMain = rawRecipes.map((a)=>TrendingRecipeModel.fromJson(a)).toList();
  //   return trendingRecipeMain!;
  // }
}
