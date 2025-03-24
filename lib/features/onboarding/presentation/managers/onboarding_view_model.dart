import 'package:flutter/material.dart';
import '../../../../data/models/onboarding_model.dart';
import '../../../../data/repositories/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel({required OnboardingRepository repo}) : _repo = repo {
    load();
  }
  final controller = PageController();
  final OnboardingRepository _repo;

  List<OnboardingPageModel> pages = [];



  Future<void> load() async {
    pages = (await _repo.fetchOnboardingPages()).cast<OnboardingPageModel>();
    notifyListeners();
  }
}
