import 'package:flutter/material.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_model.dart';
import '../../../../core/sizes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../common/recipe_icon_button_container.dart';
import '../../../common/recipe_rating.dart';
import '../../../common/recipe_time.dart';

class YourRecipeItem extends StatelessWidget {
  const YourRecipeItem({super.key, required this.recipe});

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 169 * AppSizes.wRatio,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          YourRecipeItemImage(image: recipe.photo),
          Positioned(
            bottom: 0,
            child: YourRecipeItemBottomContainer(recipe: recipe),
          ),
          Positioned(
            top: 7,
            right: 9,
            child: RecipeIconButtonContainer(
              image: 'assets/icons/heart.svg',
              containerColor: recipe.isLiked ? AppColors.redPinkMain : AppColors.pink,
              iconColor: recipe.isLiked ? Colors.white : AppColors.pinkSub, iconWidth: 12, iconHeight: 18,
              callback: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class YourRecipeItemBottomContainer extends StatelessWidget {
  const YourRecipeItemBottomContainer({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 169 * AppSizes.wRatio,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            recipe.title,
            style: TextStyle(color: Colors.black, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              RecipeRating(rating: 5, iconColor: AppColors.pinkSub),
              Spacer(flex: 1),
              RecipeTime(timeRequired: 15),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}

class YourRecipeItemImage extends StatelessWidget {
  const YourRecipeItemImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.network(
        image,
        width: 169 * AppSizes.wRatio,
        height: 162,
        fit: BoxFit.cover,
      ),
    );
  }
}
