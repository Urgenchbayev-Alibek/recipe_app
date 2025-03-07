import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/home/presentation/manager/home_view_model.dart';
import 'package:recipe_app/features/home/presentation/widgets/recipe_home_app_bar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../widgets/recently_added_main.dart';
import '../widgets/top_chef_main.dart';
import '../widgets/trending_recipe_main.dart';
import '../widgets/your_recipe_main.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.beigeColor,
        appBar: RecipeHomeAppBar(
          title: "Hi! Dianne",
          subtitle: "What are you cooking today?",
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 160),
          children: const [
            SizedBox(height: 15),
            TrendingRecipeMain(),
            SizedBox(height: 80),
            YourRecipeMain(),
            SizedBox(height: 10),
            TopChefMain(),
            SizedBox(height: 15),
            RecentlyAddedMain(),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}
