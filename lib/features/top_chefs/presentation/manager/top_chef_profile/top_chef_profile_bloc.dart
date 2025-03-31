import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/models/top_chef_profile_model.dart';
import 'package:recipe_app/data/repositories/top_chef_profile_repository.dart';
import 'top_chef_profile_state.dart';

class TopChefProfileBloc extends Cubit<TopChefProfileState> {
  final TopChefProfileRepository repository;

  TopChefProfileBloc(this.repository) : super(TopChefProfileInitial());

  Future<void> loadProfile(int chefId) async {
    try {
      emit(TopChefProfileLoading());
      final chef = await repository.getTopChefProfile(chefId);
      emit(TopChefProfileLoaded(chef));
    } catch (e) {
      emit(TopChefProfileError(e.toString()));
    }
  }
}
