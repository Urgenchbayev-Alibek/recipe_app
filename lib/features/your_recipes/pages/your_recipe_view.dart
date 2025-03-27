import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../common/widgets/recipe_bottom_navigation_bar.dart';
import '../widgets/your_recipe_appbar.dart';
import '../widgets/your_recipe_body.dart';
import '../widgets/your_recipe_bottom_model.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: YourRecipeAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YourRecipeBody(),
          ],
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
