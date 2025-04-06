import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/colors.dart';
import '../../../core/presentation/widgets/recipe_app_text.dart';
import '../../../data/models/top_chef_model.dart';
import '../../common/widgets/recipe_text_button_container.dart';
import '../../top_chefs/presentation/widgets/recipe_app_follow_button.dart';
import '../manager/following_event.dart';
import '../manager/following_state.dart';

class FollowerPartUsers extends StatelessWidget {
  const FollowerPartUsers({
    super.key,
    required this.followers,
    required this.state,
  });

  final TopChefModel followers;
  final FollowState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            followers.image,
            width: 61.w,
            height: 63.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 132.w,
          height: 60.h,
          child: Column(
            spacing: 5.h,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeAppText(
                data: "@${followers.username}",
                color: AppColors.redPinkMain,
                size: 12.sp,
              ),
              RecipeAppText(
                data: "${followers.firstName} ${followers.lastName}",
                color: Colors.white,
                size: 14.sp,
                weight: FontWeight.w300,
                font: false,
              ),
            ],
          ),
        ),
        Row(
          spacing: 10.w,
          children: [
            RecipeTextButtonContainer(
              text: state.followUserStatus == FollowStatus.success ? 'UnFollowing' : 'Following',
              textColor: AppColors.redPinkMain,
              containerColor: Colors.transparent,
              callback: () {
                if (state.followUserStatus == FollowStatus.loading) return;
                if (state.followUserStatus == FollowStatus.success) {
                  context.read<FollowingBloc>().add(
                        FollowUser(userId: followers.id),
                      );
                } else if (state.unFollowUserStatus == FollowStatus.success) {
                  context.read<FollowingBloc>().add(
                        UnfollowUser(userId: followers.id),
                      );
                }
              },
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              containerHeight: 15.h,
              containerWidth: 70.w,
              containerPaddingH: 0.w,
            ),
            RecipeAppFollowButton(
              callback: () {
                if (state.deleteUserStatus == FollowStatus.loading) return;
                context.read<FollowingBloc>().add(DeleteUser(userId: followers.id));
              },
              text: state.deleteUserStatus == FollowStatus.success ? 'Deleted' : 'Delete',
              fontSize: 15,
              weight: FontWeight.w500,
              width: 70,
              height: 21,
            ),
          ],
        ),
      ],
    );
  }
}
