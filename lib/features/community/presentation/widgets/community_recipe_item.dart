import 'package:flutter/material.dart';
import 'package:recipe_app/data/models/recipe/community_recipe_model.dart';
import 'package:recipe_app/features/community/presentation/widgets/community_recipe_chef.dart';

import 'community_recipe_body.dart';

class CommunityRecipeItem extends StatelessWidget {
  const CommunityRecipeItem({
    super.key,
    required this.recipe,
  });

  final CommunityRecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        CommunityRecipeChef(recipe: recipe),
        CommunityRecipeBody(recipe: recipe),
      ],
    );
  }
}
