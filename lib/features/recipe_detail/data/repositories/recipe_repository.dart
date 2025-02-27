// import 'package:recipe_app/core/client.dart';
// import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_model.dart';
//
// class RecipeRepository{
//   final ApiClient client;
//   RecipeRepository({required this.client})
//
//   late final RecipeDetailModel recipe;
//   Future<RecipeDetailModel> fetchRecipeById(int recipeId) async{
//     final rawRecipe = await client.fetchRecipeById(recipeId);
//     recipe = RecipeDetailModel.fromJson(rawRecipe);
//     return recipe;
//   }
// }