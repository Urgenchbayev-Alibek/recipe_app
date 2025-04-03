import '../../core/client.dart';
import '../models/recipe/recipe_model.dart';

class TrendingRecipesRepository {
  final ApiClient client;

  TrendingRecipesRepository({
    required this.client,
  });

  RecipeModel? trendRecipe;

  Future<RecipeModel> fetchTrendingMain() async {
    final rawTrendMain = await client.genericGetRequest<dynamic>('/recipes/trending-recipe');
    trendRecipe = RecipeModel.fromJson(rawTrendMain);
    print('malumot keldi${trendRecipe!.title}');
    return trendRecipe!;
  }

  Future<List<RecipeModel>> fetchTrendingRecipes() async {
    final rawTrendRecipes = await client.genericGetRequest<List<dynamic>>('/recipes/trending-recipes');
    return rawTrendRecipes.map((e) => RecipeModel.fromJson(e)).toList();
  }
}
