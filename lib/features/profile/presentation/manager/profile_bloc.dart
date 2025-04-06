import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:recipe_app/features/Profile/presentation/manager/profile_event.dart';
import 'package:recipe_app/features/Profile/presentation/manager/profile_state.dart';
import '../../../../data/repositories/profile_repository.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repo;
  final int userId;

  ProfileBloc({required ProfileRepository repo,required this.userId,})
      : _repo = repo,
        super(
          ProfileState.initial(),
        ) {
    on<ProfileLoading>(_load);
    add(ProfileLoading());
  }

  Future<void> _load(ProfileLoading event, Emitter<ProfileState> emit) async {
    state.copyWith(
      recipeStatus: ProfileStatus.loading,
      profileStatus: ProfileStatus.loading,
    );
    final profile = await _repo.fetchUserInfo(userId);
    state.copyWith(profile: profile, profileStatus: ProfileStatus.success);
    final recipes = await _repo.fetchProfileRecipes(userId);
    state.copyWith(recipes: recipes, recipeStatus: ProfileStatus.success);
  }
}
