import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_detail_view_svg_picture.dart';
import '../../utils/colors.dart';

class RecipeAppThreeDotButton extends StatelessWidget {
  const RecipeAppThreeDotButton({
    super.key, required this.callback,
  });
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        width: 7.w,
        height: 18.h,
        child: Center(
          child: RecipeAppSvgPicture(
            svg: "assets/icons/three_dots.svg",
            width: 4.w,
            height: 15.h,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
    );
  }
}
