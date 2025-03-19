import 'package:flutter/material.dart';
import '../../../../data/repositories/recipe_repository.dart';
import '../../../../data/models/profile_model.dart';
import '../../../../data/models/recipe/recipes_model.dart';
import '../../../../data/repositories/profile_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({required this.recipeRepo, required this.profileRepo}) {
    load();
  }
  final RecipeRepository recipeRepo;
  final ProfileRepository profileRepo;
  ProfileModel? myProfile;
  List<RecipeModel>? myRecipe;

  Future load() async {
    myProfile = await profileRepo.fetchMyProfile();
    myRecipe = (await recipeRepo.fetchRecipes()).cast<RecipeModel>();
    notifyListeners();
  }
}
