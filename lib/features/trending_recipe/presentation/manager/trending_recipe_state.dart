import 'package:equatable/equatable.dart';
import '../../../../data/models/recipe/recipe_model.dart';

enum TrendingStatus { idle, load, error, success }

class TrendingRecipesState extends Equatable {
  final RecipeModel? trendMain;
  final TrendingStatus? mainStatus;

  final List<RecipeModel>? trendRecipes;
  final TrendingStatus? recipeStatus;

  final TrendingStatus status;

  const TrendingRecipesState({
    required this.status,
    required this.trendMain,
    required this.trendRecipes,
    required this.mainStatus,
    required this.recipeStatus,
  });

  factory TrendingRecipesState.initial() {
    return TrendingRecipesState(
      status: TrendingStatus.load,
      trendMain: null,
      trendRecipes: [],
      mainStatus: TrendingStatus.idle,
      recipeStatus: TrendingStatus.idle,
    );
  }

  TrendingRecipesState copyWith({
    TrendingStatus? status,
    TrendingStatus? mainStatus,
    TrendingStatus? recipeStatus,
    RecipeModel? main,
    List<RecipeModel>? recipes,
  }) {
    return TrendingRecipesState(
      status: status ?? this.status,
      trendMain: main ?? this.trendMain,
      trendRecipes: recipes ?? this.trendRecipes,
      mainStatus: mainStatus ?? this.mainStatus,
      recipeStatus: recipeStatus ?? this.recipeStatus,
    );
  }

  @override
  List<Object?> get props => [
        status,
        trendRecipes,
        trendMain,
        recipeStatus,
        mainStatus,
      ];
}
