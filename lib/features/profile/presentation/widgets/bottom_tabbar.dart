import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.redPinkMain,
      tabs: [
        Text(
          "Recipe",
          style: TextStyle(
            color: AppColors.pinkSub,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "Favorites",
          style: TextStyle(
            color: AppColors.pinkSub,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
