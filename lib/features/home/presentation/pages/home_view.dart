import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../manager/home_view_model.dart';
import '../widgets/recently_added_section_home.dart';
import '../widgets/recipe_home_app_bar.dart';
import '../widgets/top_chefs_section_home.dart';
import '../widgets/trending_recipe/trending_recipe_section_home.dart';
import '../widgets/your_recipes_section_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        catsRepo: context.read(),
        recipeRepo: context.read(),
        topChefRepo: context.read(),
      ),
      child: HomeViewContent(),
    );
  }
}

class HomeViewContent extends StatelessWidget {
  const HomeViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeHomeAppBar(
        title: "Hi",
        subtitle: "What are you cooking today?",
      ),
      body: ListView(
        children: [
          SizedBox(height: 16),
          TrendingRecipeSectionHome(),
          SizedBox(height: 16),
          YourRecipesSectionHome(),
          SizedBox(height: 16),
          TopChefsSectionHome(),
          SizedBox(height: 16),
          RecentlyAddedSectionHome(),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
