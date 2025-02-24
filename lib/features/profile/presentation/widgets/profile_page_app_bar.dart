import 'package:flutter/material.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/features/profile/presentation/widgets/profile_appbar_action_container.dart';
import 'package:recipe_app/features/profile/presentation/widgets/profile_appbar_bottom.dart';
import 'package:recipe_app/features/profile/presentation/widgets/profile_appbar_leading.dart';
import 'package:recipe_app/features/profile/presentation/widgets/profile_appbar_title.dart' show ProfileAppBarTitle;


import '../pages/profile_view_model.dart';

class ProfilePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfilePageAppBar({
    super.key,
    required this.vm,
  });

  @override
  Size get preferredSize => Size(double.infinity, 245 * AppSizes.hRatio);

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      child: AppBar(
        leadingWidth: 102 * AppSizes.wRatio,
        toolbarHeight: 102 * AppSizes.hRatio,
        backgroundColor: AppColors.MainColor,
        leading: profile_appbar_leading(vm: vm),
        title: ProfileAppBarTitle(vm: vm),
        actions: [
          Align(
            child:
                ProfileAppBarActionContainer(svg: "assets/icons/plus.svg"),
            alignment: Alignment.topCenter,
          ),
          SizedBox(width: 5),
          Align(
            alignment: Alignment.topCenter,
            child: ProfileAppBarActionContainer(
                svg: "assets/icons/categories.svg"),
          ),
        ],
        bottom: ProfileAppBarBottom(vm: vm),
      ),
    );
  }
}
