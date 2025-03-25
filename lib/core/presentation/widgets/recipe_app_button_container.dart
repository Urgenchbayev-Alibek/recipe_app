import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_image_with_like.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_svg_button.dart';
import '../../../Core/utils/colors.dart';

class RecipeAppButtonContainer extends StatelessWidget {
  const RecipeAppButtonContainer({
    super.key,
    required this.widget,
  });

  final RecipeImageWithLike widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: widget.onPress ? AppColors.redPinkMain : AppColors.pink,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: RecipeSvgButton(
            callback: (){},
            svg: 'assets/icons/heart.svg',
            width: 16.w,
            height: 15.h,
            color: widget.onPress ? Colors.white : AppColors.pinkSub,
          ),
        ),
      ),
    );
  }
}
