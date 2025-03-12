import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/recipe_model.dart';
import '../../../category_detail/presentation/widgets/recipe_item.dart';
import '../manager/home_view_model.dart';

class RecentlyAddedSection extends StatelessWidget {
  const RecentlyAddedSection({
    super.key,
    required this.recipes,
  });

  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recently Added",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var recentRecipe in recipes)
                RecipeItem(recipe: recentRecipe),
            ],
          ),
        ],
      ),
    );
  }
}
