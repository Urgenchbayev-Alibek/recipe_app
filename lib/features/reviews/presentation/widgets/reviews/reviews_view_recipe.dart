import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/models/recipe/reviews_recipe_model.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews/review_view_image_item.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews/reviews_recipe_item_user.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews/reviews_recipe_stars_item.dart';

import '../../../../../core/presentation/widgets/recipe_elevated_button.dart';
import '../../../../../core/utils/colors.dart';

class ReviewsViewRecipe extends StatelessWidget {
  const ReviewsViewRecipe({
    super.key,
    required this.recipe,
  });

  final ReviewsRecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 223.h,
      padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.redPinkMain,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReviewsViewImageItem(
            image: recipe.image,
          ),
          SizedBox(
            width: 178.w,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  recipe.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                  maxLines: 1,
                ),
                Row(
                  spacing: 4.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReviewsRecipeStars(rating: recipe.rating.toInt()),
                    Text(
                      "(${recipe.reviewsCount} Reviews)",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      maxLines: 1,
                    ),
                  ],
                ),
                ReviewsRecipeItemUser(user: recipe.user),
                SizedBox(
                  height: 24,
                  width: 126,
                  child: RecipeElevatedButton(
                    text: "Add Review",
                    callback: () {
                      context.push(Routes.getCreateReview(recipe.id));
                    },
                    size: Size(126, 24),
                    foregroundColor: AppColors.redPinkMain,
                    fontSize: 13,
                    backGroundColor: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
