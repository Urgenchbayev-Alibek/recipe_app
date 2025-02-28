import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';

class BottomShadow extends StatelessWidget {
  const BottomShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 128,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.beigeColor,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
