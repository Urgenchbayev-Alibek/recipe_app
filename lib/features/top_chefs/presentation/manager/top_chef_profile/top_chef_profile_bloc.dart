import 'package:flutter_bloc/flutter_bloc.dart';
import 'top_chef_profile_events.dart';
import 'top_chef_profile_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopChefProfileBloc extends Bloc<TopChefProfileEvent, TopChefProfileState> {
  TopChefProfileBloc() : super(TopChefProfileLoading()) {
    on<LoadTopChefProfile>(_onLoadProfile);
  }

  final String apiUrl = "http://localhost:8888/api/top_chefs";

  Future<void> _onLoadProfile(
      LoadTopChefProfile event, Emitter<TopChefProfileState> emit) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/${event.chefId}'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(TopChefProfileLoaded(
          firstName: data['firstName'],
          photo: data['photo'],
        ));
      } else {
        emit(TopChefProfileError('Profile not found'));
      }
    } catch (e) {
      emit(TopChefProfileError('Failed to load profile'));
    }
  }
}
