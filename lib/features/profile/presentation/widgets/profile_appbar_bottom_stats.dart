import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import '../pages/profile_view_model.dart';
import 'bottom_stats.dart';

class ProfileAppBarBottomStats extends StatelessWidget {
  const ProfileAppBarBottomStats({
    super.key,
    required this.vm,
  });

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.MainColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 2,
          color: AppColors.Pink,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomStats(
            number: vm.myProfile!.recipeCount,
            subtitle: "Recipes",
          ),
          Container(height: 26, width: 2, color: AppColors.Pink),
          BottomStats(
            number: vm.myProfile!.followingCount,
            subtitle: "Following",
          ),
          Container(height: 26, width: 2, color: AppColors.Pink),
          BottomStats(
            number: vm.myProfile!.followerCount,
            subtitle: "Followers",
          ),
        ],
      ),
    );
  }
}
