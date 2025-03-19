import 'package:flutter/material.dart';
import 'package:recipe_app/core/sizes.dart';
import 'package:recipe_app/core/utils/colors.dart';

import '../pages/profile_view_model.dart';

class ProfileAppBarTitle extends StatelessWidget {
  const ProfileAppBarTitle({
    super.key,
    required this.vm,
  });

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170 * AppSizes.wRatio,
      height: 102 * AppSizes.hRatio,
      child: Column(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vm.myProfile!.firstName,
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            "@${vm.myProfile!.username}",
            style: TextStyle(
              color: AppColors.pinkSub,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Text(
            vm.myProfile!.bio,
            maxLines: 3,
            softWrap: true,
            style: TextStyle(
              color: AppColors.pinkSub,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
