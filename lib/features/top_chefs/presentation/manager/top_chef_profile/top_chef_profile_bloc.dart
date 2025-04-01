import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/top_chefs/presentation/manager/top_chef_profile/top_chef_profile_state.dart';

import '../../../../../data/repositories/top_chef_profile_repository.dart';
import 'top_chef_profile_events.dart';

class TopChefBloc extends Bloc<TopChefProfileEvent, TopChefState> {
  final TopChefRepository repository;

  TopChefBloc(this.repository) : super(TopChefInitial()) {
    on<TopChefsProfileLoading>((event, emit) async {
      emit(TopChefLoading());
      try {
        final chefs = await repository.fetchTopChefs();
        emit(TopChefLoaded(chefs));
      } catch (e) {
        emit(TopChefError(e.toString()));
      }
    });
  }
}
