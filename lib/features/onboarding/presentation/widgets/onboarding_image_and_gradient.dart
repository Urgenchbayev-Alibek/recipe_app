import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';

import '../manager/onboarding_view_model.dart';

class onboarding_imageAndGradient extends StatelessWidget {
  const onboarding_imageAndGradient({
    super.key,
    required this.ovm, required this.index,
  });
final int index;
  final OnBoardingViewModel ovm;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          ovm.pages[index].picture,
          width: double.infinity,
          height: 741,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 444,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                AppColors.MainColor,
                AppColors.MainColor.withValues(alpha: 0.1)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
