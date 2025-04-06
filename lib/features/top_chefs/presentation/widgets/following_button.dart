import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/colors.dart';
import '../../../../core/presentation/widgets/recipe_app_text.dart';

class FollowingButton extends StatelessWidget {
  const FollowingButton({
    super.key,
    this.size = 8,
    this.backColor = AppColors.redPinkMain,
    this.textColor = Colors.white,
    this.text = "Following",
  });

  final double size;
  final String text;
  final Color backColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: RecipeAppText(
        data: text,
        color: textColor,
        size: size.sp,
      ),
    );
  }
}
