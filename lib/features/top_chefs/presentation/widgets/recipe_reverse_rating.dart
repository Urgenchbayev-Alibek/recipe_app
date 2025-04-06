import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_svg_button.dart';
import '../../../../Core/utils/colors.dart';
import '../../../../core/presentation/widgets/recipe_app_text.dart';

class RecipeReverseRating extends StatelessWidget {
  const RecipeReverseRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2.w,
      children: [
        RecipeAppText(data: "3587", color: AppColors.pinkSub, size: 12.sp),
        RecipeSvgButton(
          svg: "assets/icons/star.svg",
          width: 12.w,
          color: AppColors.pinkSub,
          height: 10,
          callback: () {},
        ),
      ],
    );
  }
}
