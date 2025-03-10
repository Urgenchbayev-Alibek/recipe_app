import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../manager/community_view_model.dart';
import '../widgets/community_app_bar.dart';
import '../widgets/newest_recipes.dart';
import '../widgets/oldest_recipes.dart';
import '../widgets/top_recipes.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityViewModel>();
    if (vm.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CommunityAppBar(),
        body: TabBarView(
          children: [
            TopRecipes(),
            NewestRecipes(),
            OldestRecipes(),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
