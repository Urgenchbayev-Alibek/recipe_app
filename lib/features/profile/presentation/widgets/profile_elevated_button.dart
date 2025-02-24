import 'package:flutter/material.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/core/utils/app_colors.dart';

class profile_elevated_button extends StatelessWidget {
  const profile_elevated_button({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175 * AppSizes.wRatio,
      height: 26 * AppSizes.hRatio,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.Pink,
          foregroundColor: AppColors.PinkSub,
        ),
        child: Text(text),
      ),
    );
  }
}
