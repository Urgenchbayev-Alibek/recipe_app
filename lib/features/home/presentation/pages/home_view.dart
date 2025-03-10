import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../manager/home_view_model.dart';
import '../widgets/home_view_app_bar.dart';
import '../widgets/recently_added_section.dart';
import '../widgets/top_chefs_section.dart';
import '../widgets/trending_recipe_section_home.dart';
import '../widgets/your_recipes_section.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return switch (state.status) {
          HomeStatus.loading => Center(child: CircularProgressIndicator()),
          HomeStatus.error => Center(child: Text("Something went wrong...")),
          HomeStatus.idle => Scaffold(
              extendBody: true,
              appBar: HomeViewAppBar(categories: state.categories),
              body: ListView(
                padding: EdgeInsets.only(bottom: 100.h),
                children: [
                  TrendingRecipeSection(trendingRecipe: state.trendingRecipe!),
                  SizedBox(height: 15),
                  YourRecipesSection(title: "Your Recipes", recipes: state.yourRecipes),
                  SizedBox(height: 15),
                  TopChefsSection(topChefs: state.topChefs),
                  SizedBox(height: 15),
                  RecentlyAddedSection(recipes: state.recentlyAddedRecipes),
                ],
              ),
              bottomNavigationBar: RecipeBottomNavigationBar(),
            ),
        };
      },
    );
  }
}
