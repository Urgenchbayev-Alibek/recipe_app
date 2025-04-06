import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/common/common.dart';
import '../manager/top_chef_profile/top_chefs_profile_bloc.dart';
import '../manager/top_chef_profile/top_chefs_profile_state.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size(double.infinity, 72);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopChefsProfileBloc, TopChefsProfileState>(
      builder: (context, state) {
        if (state.profileStatus == TopChefsProfileStatus.success) {
          return RecipeAppBar(
            title: "@${state.userInfo!.firstName}",
            actions: [
              RecipeIconButtonContainer(
                iconHeight: 14,
                iconWidth: 14,
                callback: () {},
                image: "assets/icons/share.svg",
              ),
              SizedBox(
                width: 5,
              ),
              RecipeIconButtonContainer(
                iconWidth: 14,
                iconHeight: 14,
                callback: () {},
                image: "assets/icons/three_dots.svg",
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
