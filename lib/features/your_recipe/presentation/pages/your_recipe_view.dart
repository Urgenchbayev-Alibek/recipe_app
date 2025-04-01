import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/Core/utils/colors.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/common/common.dart';

import '../../../home/presentation/widgets/your_recipe_item.dart';

class YourRecipeView extends StatelessWidget {
  const YourRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Your Recipe",
        actions: [
          RecipeIconButtonContainer(
              image: "assets/icons/notification.svg",
              callback: () {
                context.push(Routes.notification);
              },
              iconWidth: 14,
              iconHeight: 19),
          SizedBox(width: 5),
          RecipeIconButtonContainer(image: "assets/icons/search.svg", callback: () {}, iconWidth: 14, iconHeight: 19),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 285.h,
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Most Viewed Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
