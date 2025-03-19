import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    super.key,
    required this.timeRequired,
    this.color = AppColors.pinkSub,
  });

  final int timeRequired;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        SvgPicture.asset(
          "assets/icons/clock.svg",
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        Text(
          "${timeRequired.toString()}min",
          style: TextStyle(
            color: color,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}