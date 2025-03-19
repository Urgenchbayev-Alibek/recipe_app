import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class BottomStats extends StatelessWidget {
  const BottomStats({
    super.key, required this.number, required this.subtitle,
  });

  final int number;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            color: AppColors.pinkSub,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.pinkSub,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 1,
          ),
        ),
      ],
    );
  }
}
