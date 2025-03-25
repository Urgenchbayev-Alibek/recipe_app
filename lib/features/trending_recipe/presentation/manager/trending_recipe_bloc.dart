import 'package:bloc/bloc.dart';
import 'package:recipe_app/features/trending_recipe/presentation/manager/trending_recipe_event.dart';
import 'package:recipe_app/features/trending_recipe/presentation/manager/trending_recipe_state.dart';

import '../../../../data/repositories/trending-recipes_repository.dart';

class TrendingRecipeBloc extends Bloc<TrendingRecipeEvent, TrendingRecipesState> {
  final TrendingRecipesRepository _trendRepo;

  TrendingRecipeBloc({
    required TrendingRecipesRepository trendRepo,
  })
      : _trendRepo = trendRepo,
        super(
        TrendingRecipesState.initial(),
      ) {
    on<TrendingLoad>(_load);
    add(TrendingLoad());
  }

  Future<void> _load(TrendingLoad event, Emitter<TrendingRecipesState> emit) async {
    emit(
      state.copyWith(
        status: TrendingStatus.load,
        mainStatus: TrendingStatus.load,
        recipeStatus: TrendingStatus.load,
      ),
    );
    final main = await _trendRepo.fetchTrendingMain();
    emit(state.copyWith(main: main, mainStatus: TrendingStatus.success));
    final recipes = await _trendRepo.fetchTrendingRecipes();
    emit(state.copyWith(recipes: recipes, recipeStatus: TrendingStatus.success));
  }
}
