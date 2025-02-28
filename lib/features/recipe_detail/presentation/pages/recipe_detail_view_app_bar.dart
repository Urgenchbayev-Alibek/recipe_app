import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/features/profile/presentation/widgets/profile_appbar_action_container.dart';

import '../../../../core/utils/app_colors.dart';

class RecipeDetailViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeDetailViewAppBar({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 140);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        leading: Center(
          child: SvgPicture.asset(
            "assets/icons/back-arrow.svg",
            height: 14,
            width: 14,
          ),
        ),
        title: Text(
          "Trending Recipes",
          style: TextStyle(color: AppColors.redPinkMain),
        ),
        actions: [
          AppBarActionContainer(svg: "assets/icons/heart.svg"),
          AppBarActionContainer(svg: "assets/icons/share.svg")
        ]);
  }
}
