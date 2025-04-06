import 'package:bloc/bloc.dart';
import 'package:recipe_app/features/top_chefs/presentation/manager/top_chef_profile/top_chefs_profile_event.dart';
import 'package:recipe_app/features/top_chefs/presentation/manager/top_chef_profile/top_chefs_profile_state.dart';
import '../../../../../data/repositories/profile_repository.dart';

class TopChefsProfileBloc extends Bloc<TopChefsProfileEvent, TopChefsProfileState> {
  final ProfileRepository _userRepo;

  TopChefsProfileBloc({
    required ProfileRepository userRepo,
    required int userId,
  })  : _userRepo = userRepo,
        super(TopChefsProfileState.initial()) {
    on<TopChefsProfileLoading>(_load);
    add(TopChefsProfileLoading(userId: userId));
  }

  Future<void> _load(TopChefsProfileLoading event, Emitter<TopChefsProfileState> emit) async {
    emit(state.copyWith(recipeStatus: TopChefsProfileStatus.loading, profileStatus: TopChefsProfileStatus.loading));
    final user = await _userRepo.fetchUserInfo(event.userId);
    emit(state.copyWith(profile: user, profileStatus: TopChefsProfileStatus.success));
    final recipe = await _userRepo.fetchProfileRecipes(event.userId);
    emit(state.copyWith(recipe: recipe, recipeStatus: TopChefsProfileStatus.success));
  }
}
