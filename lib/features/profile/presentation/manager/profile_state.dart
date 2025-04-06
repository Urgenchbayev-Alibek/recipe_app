import 'package:equatable/equatable.dart';
import '../../../../data/models/profile_model.dart';
import '../../../../data/models/recipe/recipe_model.dart';

enum ProfileStatus { idle, success, loading, error }

class ProfileState extends Equatable {
  final List<RecipeModel>? recipes;
  final ProfileModel? profileModel;
  final ProfileStatus recipeStatus;
  final ProfileStatus profileStatus;

  const ProfileState({
    required this.profileModel,
    required this.recipes,
    required this.recipeStatus,
    required this.profileStatus,
  });

  factory ProfileState.initial() {
    return ProfileState(
      profileModel: null,
      recipes: [],
      recipeStatus: ProfileStatus.loading,
      profileStatus: ProfileStatus.loading,
    );
  }

  ProfileState copyWith({
    List<RecipeModel>? recipes,
    ProfileModel? profile,
    ProfileStatus? profileStatus,
    ProfileStatus? recipeStatus,
  }) {
    return ProfileState(
      profileModel: profile ?? profileModel,
      recipes: recipes ?? this.recipes,
      recipeStatus: recipeStatus ?? this.recipeStatus,
      profileStatus: profileStatus ?? this.profileStatus,
    );
  }

  @override
  List<Object?> get props => [recipeStatus, recipes, profileStatus, profileModel];
}
