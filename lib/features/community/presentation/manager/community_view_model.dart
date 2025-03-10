import 'package:flutter/material.dart';
import 'package:recipe_app/data/repositories/recipe_repository.dart';
import '../../data/models/community_model.dart';

class CommunityViewModel extends ChangeNotifier {
  CommunityViewModel({
    required RecipeRepository comRepo,
    required this.order,
    required this.limit,
    required this.descending,
  }) : _communityRepo = comRepo {
    load();
  }

  final RecipeRepository _communityRepo;
  final String order;
  final int limit;
  bool descending = true;
  bool isLoading = true;
  late final List<CommunityRecipeModel> _community = [];

  List<CommunityRecipeModel> get community => _community;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    _community.clear();
    _community.addAll(await _communityRepo.fetchCommunityRecipes(limit, order, descending));
    isLoading = false;
    notifyListeners();
  }

  List<CommunityRecipeModel> get topRecipes {
    List<CommunityRecipeModel> sortedList = List.from(_community);
    sortedList.sort((a, b) => b.rating.compareTo(a.rating));
    return sortedList;
  }

  List<CommunityRecipeModel> get newestRecipes {
    List<CommunityRecipeModel> sortedList = List.from(_community);
    sortedList.sort((a, b) => DateTime.parse(b.created).compareTo(DateTime.parse(a.created)));
    return sortedList;
  }
  List<CommunityRecipeModel> get oldestRecipes {
    List<CommunityRecipeModel> sortedList = List.from(_community);
    sortedList.sort((a, b) => DateTime.parse(a.created).compareTo(DateTime.parse(b.created)));
    return sortedList;
  }
}
