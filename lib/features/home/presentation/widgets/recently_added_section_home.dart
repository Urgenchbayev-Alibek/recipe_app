import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/app_colors.dart';

import '../../../../core/sizes.dart';
import '../../../category_detail/data/models/recipe_model.dart';
import '../../../category_detail/presentation/widgets/recipe_item.dart';
import '../manager/home_view_model.dart';

class RecentlyAddedSectionHome extends StatelessWidget {
  const RecentlyAddedSectionHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, List<RecipeModel>>(
      selector: (context, vm) => vm.yourRecipes,
      builder: (context, recipes, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 9,
          children: [
            Text("Recently Added", style: TextStyle(color: AppColors.redPinkMain, fontFamily: "Poppins", fontSize: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var recipe in recipes) RecipeItem(recipe: recipe),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
