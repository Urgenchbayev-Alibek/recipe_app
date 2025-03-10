import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'trending_recipe_home.dart';

class TrendingRecipeSectionHome extends StatelessWidget {
  const TrendingRecipeSectionHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trending Recipe", style: TextStyle(color: AppColors.redPinkMain, fontSize: 15, fontFamily: "Poppins")),
          TrendingRecipeItemHome(),
        ],
      ),
    );
  }
}
