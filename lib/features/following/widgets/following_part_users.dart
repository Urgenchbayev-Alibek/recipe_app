import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/colors.dart';
import '../../../core/presentation/widgets/recipe_app_text.dart';
import '../../../core/presentation/widgets/recipe_app_three_dot_button.dart';
import '../../../data/models/top_chef_model.dart';
import '../../common/widgets/recipe_text_button_container.dart';
import '../../top_chefs/presentation/widgets/recipe_app_follow_button.dart';
import '../manager/following_event.dart';
import '../manager/following_state.dart';

class FollowingPartUsers extends StatelessWidget {
  const FollowingPartUsers({
    super.key,
    required this.followings,
    required this.state,
  });

  final TopChefModel followings;
  final FollowState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            followings.image,
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
                data: "@${followings.username}",
                color: AppColors.redPinkMain,
                size: 12.sp,
              ),
              RecipeAppText(
                data: "${followings.firstName} ${followings.lastName}",
                color: Colors.white,
                size: 14.sp,
                weight: FontWeight.w300,
                font: false,
              ),
            ],
          ),
        ),
        Row(
          spacing: 8.w,
          children: [
            RecipeAppFollowButton(
              callback: () {
                if (state.followUserStatus == FollowStatus.loading || state.unFollowUserStatus == FollowStatus.loading) return;
                if (state.followUserStatus == FollowStatus.success) {
                  context.read<FollowingBloc>().add(FollowUser(userId: followings.id));
                } else {
                  context.read<FollowingBloc>().add(UnfollowUser(userId: followings.id));
                }
              },
              text: state.followUserStatus == FollowStatus.success ? 'Unfollowing' : 'Following',
              fontSize: 15,
              weight: FontWeight.w500,
              width: 109.09,
              height: 21,
            ),
            RecipeAppThreeDotButton(
              callback: () {
                showModalBottomSheet(
                  elevation: 4,
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 56.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 17.h,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            spacing: 10.w,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  followings.image,
                                  width: 64.w,
                                  height: 63.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: RecipeAppText(
                                  data: "@${followings.username}",
                                  color: AppColors.redPinkMain,
                                  size: 15.sp,
                                  weight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          RecipeTextButtonContainer(
                            text: "Manage notifications",
                            textColor: AppColors.beigeColor,
                            containerColor: Colors.transparent,
                            containerPaddingH: 2,
                            containerWidth: double.infinity,
                            fontWeight: FontWeight.w400,
                            containerHeight: 23.h,
                            callback: () {},
                          ),
                          RecipeTextButtonContainer(
                            text: "Mute notifications",
                            textColor: AppColors.beigeColor,
                            containerColor: Colors.transparent,
                            containerPaddingH: 2,
                            containerWidth: double.infinity,
                            fontWeight: FontWeight.w400,
                            containerHeight: 23.h,
                            callback: () {},
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
