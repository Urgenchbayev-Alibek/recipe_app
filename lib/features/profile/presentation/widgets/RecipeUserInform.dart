import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/colors.dart';
import '../../../../core/presentation/widgets/recipe_app_text.dart';

class AppbarInform extends StatelessWidget {
  const AppbarInform({
    super.key,
    required this.number,
    required this.label,
  });

  final num number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1,
      children: [
        RecipeAppText(
          data: number.toString(),
          size: 15.sp,
          color: AppColors.pinkColor,

        ),
        RecipeAppText(
          data: label,
          size: 12.sp,
          color: AppColors.pinkColor,
        ),
      ],
    );
  }
}