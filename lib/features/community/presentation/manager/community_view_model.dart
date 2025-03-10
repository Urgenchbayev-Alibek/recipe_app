import 'package:flutter/material.dart';
import '../../data/models/community_model.dart';
import '../../data/repositories/community_repository.dart';

class CommunityViewModel extends ChangeNotifier {
  CommunityViewModel({
    required CommunityRepository comRepo,
    required this.order,
    required this.limit,
    required this.descending,
  }) : _communityRepo = comRepo {
    load();
  }

  final CommunityRepository _communityRepo;
  final String order;
  final int limit;
  bool descending = true;
  bool isLoading = true;
  late final List<CommunityModel> _community = [];

  List<CommunityModel> get community => _community;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    _community.clear();
    _community.addAll(await _communityRepo.fetchCommunityRecipes(limit, order, descending));
    isLoading = false;
    notifyListeners();
  }

  List<CommunityModel> get topRecipes {
    List<CommunityModel> sortedList = List.from(_community);
    sortedList.sort((a, b) => b.rating.compareTo(a.rating));
    return sortedList;
  }

  List<CommunityModel> get newestRecipes {
    List<CommunityModel> sortedList = List.from(_community);
    sortedList.sort((a, b) => DateTime.parse(b.created).compareTo(DateTime.parse(a.created)));
    return sortedList;
  }
  List<CommunityModel> get oldestRecipes {
    List<CommunityModel> sortedList = List.from(_community);
    sortedList.sort((a, b) => DateTime.parse(a.created).compareTo(DateTime.parse(b.created)));
    return sortedList;
  }
}
