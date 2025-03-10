import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/categories_horizontal_appbar_bottom.dart';
import 'package:recipe_app/features/home/presentation/widgets/recipe_home_app_bar_title.dart';
import '../../../../core/sizes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../categories/data/models/categories_model.dart';
import '../../../common/recipe_icon_button_container.dart';
import '../manager/home_view_model.dart';

class RecipeHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeHomeAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Size get preferredSize => const Size(double.infinity, 110);

  @override
  Widget build(BuildContext context) {
    var categories = context.select<HomeViewModel, List<CategoryModel>>((value) => value.categories);
    var selected = context.select<HomeViewModel, CategoryModel?>((value) => value.selected);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      child: AppBar(
        toolbarHeight: 70,
        leadingWidth: double.infinity,
        leading: RecipeHomeAppBarTitle(
          title: "Hi",
          subtitle: "What are you cooking today?",
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            iconColor: AppColors.pinkSub,
            callback: () {}, iconWidth: 12, iconHeight: 18,
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconColor: AppColors.pinkSub,
            callback: () {}, iconWidth: 12, iconHeight: 18,
          ),
        ],
        bottom: CategoriesHorizontalScrollBar(
          categories: categories,
          selected: selected,
        ),
      ),
    );
  }
}
