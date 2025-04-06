import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/utils/colors.dart';
import '../../../../core/presentation/widgets/recipe_app_text.dart';
import '../../../../core/presentation/widgets/recipe_image_with_like.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/models/recipe/recipe_model.dart';
import '../../../common/widgets/recipe_rating.dart';
import '../../../common/widgets/recipe_time.dart';
class CategoryDetailInfo extends StatelessWidget {
  const CategoryDetailInfo({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.getRecipeDetail(recipe.id));
      },

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 158.50.w,
            height: 76.h,
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 3.h,
              bottom: 4.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(14),
              ),
              border: Border.all(color: AppColors.pinkSub, width: 1.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeAppText(
                  data: recipe.title,
                  color: AppColors.beigeColor,
                  size: 12.sp,
                  line: 1,
                ),
                RecipeAppText(
                  data: recipe.description,
                  color: AppColors.beigeColor,
                  size: 13.sp,
                  font: false,
                  line: 2,
                  height: 1,
                  weight: FontWeight.w300,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeRating(rating: recipe.rating),
                    RecipeTime(timeRequired: recipe.timeRequired),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: RecipeImageWithLike<RecipeModel>(
              recipe: recipe, getPhotoUrl: (RecipeModel recipeModel ) {
              return recipeModel.photo;
            },
            ),
          ),
        ],
      ),
    );
  }
}
