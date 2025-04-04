import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../data/models/recipe/recipe_model.dart';

class RecipeItemTitle extends StatelessWidget {
  const RecipeItemTitle({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Text(
      recipe.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.beigeColor,
        fontSize: 12,
      ),
    );
  }
}
