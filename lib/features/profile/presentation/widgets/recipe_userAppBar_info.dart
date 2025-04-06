import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/utils/colors.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/models/profile_model.dart';
import 'RecipeUserInform.dart';

class AppbarInfo extends StatelessWidget {
  const AppbarInfo({
    super.key,
    required this.user,
  });

  final ProfileModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.pinkSub,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppbarInform(
            number: user.recipeCount,
            label: "Recipes",
          ),
          GestureDetector(
            onTap: () => context.push(
              Routes.getFollow(user.id),
            ),
            child: Container(
              width: 1,
              height: 26,
              color: AppColors.pinkSub,
            ),
          ),
          AppbarInform(
            number: user.followingCount,
            label: "Following",
          ),
          Container(width: 1, height: 26, color: AppColors.pinkSub),
          AppbarInform(
            number: user.followerCount,
            label: "Followers",
          ),
        ],
      ),
    );
  }
}
