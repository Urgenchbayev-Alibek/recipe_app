import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_ingredients_item.dart';

import '../../../../data/models/ingredient_model.dart';


class RecipeDetailIngredientsSection extends StatelessWidget {
  const RecipeDetailIngredientsSection({
    super.key,
    required this.ingredients,
  });

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ingredients",
        ),
        SizedBox(height: 24),
        for (var item in ingredients) RecipeIngredientItem(text: "${item.amount} ${item.name}")
      ],
    );
  }
}