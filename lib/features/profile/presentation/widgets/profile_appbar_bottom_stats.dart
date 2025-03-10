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
        color: AppColors.beigeColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 2,
          color: AppColors.pink,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomStats(
            number: vm.myProfile!.recipes,
            subtitle: "Recipes",
          ),
          Container(height: 26, width: 2, color: AppColors.pink),
          BottomStats(
            number: vm.myProfile!.following,
            subtitle: "Following",
          ),
          Container(height: 26, width: 2, color: AppColors.pink),
          BottomStats(
            number: vm.myProfile!.followers,
            subtitle: "Followers",
          ),
        ],
      ),
    );
  }
}
