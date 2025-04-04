import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';

class YourRecipeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.beigeColor,
      leading: Padding(
        padding: EdgeInsets.all(15.0),
        child: SvgPicture.asset(
          'assets/icons/vector.svg',
          width: 24,
          height: 14,
        ),
      ),
      title: Center(
        child: Text(
          'Your Recipes',
          style: TextStyle(color: AppColors.redPinkMain, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
