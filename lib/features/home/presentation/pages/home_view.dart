import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../widgets/appbar_action_item.dart';
import '../widgets/appbar_title_item.dart';
import '../widgets/home_view_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.beigeColor,
        title: const AppbarTitleItem(),
        actions: const [
          AppBarActionItem(),
        ],
      ),
      body: const HomeViewBody(),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}