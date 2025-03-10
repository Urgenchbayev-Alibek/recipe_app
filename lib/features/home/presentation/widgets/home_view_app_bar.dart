import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/home/presentation/widgets/recipe_app_bar_bottom.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/models/categories_model.dart';
import '../../../common/recipe_icon_button_container.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeViewAppBar({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Size get preferredSize => const Size(double.infinity, 120);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 10.h),
      child: AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! Dianne",
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 25,
              ),
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          RecipeIconButtonContainer(
            image: 'assets/icons/notification.svg',
            callback: () {},
            iconWidth: 14,
            iconHeight: 19,
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconWidth: 12,
            iconHeight: 18,
            callback: () {},
          ),
        ],
        bottom: RecipeAppBarBottom(categories: categories),
      ),
    );
  }
}
