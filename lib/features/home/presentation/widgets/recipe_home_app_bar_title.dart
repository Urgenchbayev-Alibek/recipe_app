import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class RecipeHomeAppBarTitle extends StatelessWidget {
  const RecipeHomeAppBarTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 25.31,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 13.45),
        ),
      ],
    );
  }
}
