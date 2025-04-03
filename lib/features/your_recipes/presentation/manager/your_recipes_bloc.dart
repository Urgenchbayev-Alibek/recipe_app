import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/your_recipes/presentation/manager/your_recipes_state.dart';

import '../../../../data/repositories/recipe_repository.dart';

part 'your_recipes_events.dart';

class YourRecipeBloc extends Bloc<YourRecipesEvent, YourRecipeState> {
  YourRecipeBloc({required RecipeRepository repo})
      : _repo = repo,
        super(YourRecipeState.initial()) {
    on<YourRecipesLoading>(_onLoad);
    add(YourRecipesLoading());
  }

  final RecipeRepository _repo;

  Future<void> _onLoad(YourRecipesLoading event, Emitter<YourRecipeState> emit) async {
    emit(state.copyWith(
      mostViewRecipeStatus: YourRecipesStatus.loading,
      recipeStatus: YourRecipesStatus.loading,
    ));

    final mostViewRecipe = await _repo.fetchYourRecipes();
    emit(state.copyWith(mostViewRecipe: mostViewRecipe, mostViewRecipeStatus: YourRecipesStatus.success));
    final recipes = await _repo.fetchYourRecipes();
    emit(state.copyWith(recipes: recipes, recipeStatus: YourRecipesStatus.success));
  }
}
