import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/sizes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../common/recipe_icon_button.dart';
import '../../../common/recipe_icon_button_container.dart';
class CommunityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommunityAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 100);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38),
      child: AppBar(
        toolbarHeight: 70,
        leadingWidth: 35,
        leading: RecipeIconButton(
          callback: context.pop,
          image: "assets/icons/back-arrow.svg",
        ),
        centerTitle: true,
        title: Text(
          "Community",
          style: TextStyle(color: AppColors.redPinkMain, fontSize: 20, fontFamily: "Poppins"),
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            iconColor: AppColors.pinkSub, iconWidth: 12, iconHeight: 18,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconColor: AppColors.pinkSub, iconWidth: 12, iconHeight: 18,
            callback: () {},
          )
        ],
        bottom: TabBar(
          dividerColor: Colors.transparent,
          indicator: ShapeDecoration(
            color: AppColors.redPinkMain,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.symmetric(vertical: 12),
          labelPadding: EdgeInsets.symmetric(horizontal: 5),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.redPinkMain,
          tabs: [
            Tab(text: "Top Recipes"),
            Tab(text: "Newest"),
            Tab(text: "Oldest"),
          ],
        ),
      ),
    );
  }
}
