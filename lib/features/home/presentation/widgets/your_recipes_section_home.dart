import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_model.dart';
import 'package:recipe_app/features/home/presentation/widgets/your_recipe_item.dart';
import '../../../../core/sizes.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/home_view_model.dart';

class YourRecipesSectionHome extends StatelessWidget {
  const YourRecipesSectionHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var recipes = context.select<HomeViewModel, List<RecipeModel>>((vm) => vm.yourRecipes);
    return Center(
      child: Container(
        height: 255,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 9,
          children: [
            Text("Your Recipes", style:TextStyle(color: AppColors.redPinkMain, fontFamily: "Poppins", fontSize: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var recipe in recipes) YourRecipeItem(recipe: recipe),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
