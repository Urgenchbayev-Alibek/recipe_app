import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/recipe/recipe_model.dart';

enum YourRecipesStatus { idle, loading, success, error }

class YourRecipeState extends Equatable {
  final List<RecipeModel> mostViewRecipe;
  final YourRecipesStatus mostViewRecipeStatus;
  final List<RecipeModel> recipes;
  final YourRecipesStatus recipeStatus;

  const YourRecipeState({
    required this.mostViewRecipe,
    required this.mostViewRecipeStatus,
    required this.recipes,
    required this.recipeStatus,
  });

  factory YourRecipeState.initial() {
    return YourRecipeState(
      mostViewRecipe: [],
      mostViewRecipeStatus: YourRecipesStatus.idle,
      recipes: [],
      recipeStatus: YourRecipesStatus.idle,
    );
  }

  YourRecipeState copyWith({
    List<RecipeModel>? mostViewRecipe,
    List<RecipeModel>? recipes,
    YourRecipesStatus? mostViewRecipeStatus,
    YourRecipesStatus? recipeStatus,
  }) {
    return YourRecipeState(
      mostViewRecipe: mostViewRecipe ?? this.mostViewRecipe,
      recipes: recipes ?? this.recipes,
      mostViewRecipeStatus: mostViewRecipeStatus ?? this.mostViewRecipeStatus,
      recipeStatus: recipeStatus ?? this.recipeStatus,
    );
  }

  @override
  List<Object?> get props => [mostViewRecipe, mostViewRecipeStatus, recipes, recipeStatus];
}
