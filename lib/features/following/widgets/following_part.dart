import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_text_field_simple.dart';
import '../../../../Core/utils/colors.dart';
import '../manager/following_event.dart';
import '../manager/following_state.dart';
import 'following_part_users.dart';

class FollowingPart extends StatelessWidget {
  const FollowingPart({
    super.key,
    required this.contr,
  });

  final TextEditingController contr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          RecipeTextFieldSimple(
            validator: (value) => null,
            controller: contr,
            width: 355,
            height: 34,
            hint: 'Search',
            isCenter: false,
            textColor: AppColors.redPinkMain,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<FollowingBloc, FollowState>(
              builder: (context, state) => switch(state.followingStatus) {
                null => throw UnimplementedError(),
                FollowStatus.idle => Center(child: Text("loaded")),
                FollowStatus.success => ListView(
                  padding: EdgeInsets.only(bottom: 200.h),
                  children: List.generate(
                    state.followings!.length,
                        (index) => SizedBox.fromSize(
                      size: Size(0, 75.h),
                      child: Column(
                        children: [
                          FollowingPartUsers(
                            followings: state.followings![index],
                            state: state,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FollowStatus.loading => Center(child: LinearProgressIndicator(),),
                FollowStatus.error => Center(child: Text("Something went wrong...")),
              },
            ),
          ),
        ],
      ),
    );
  }
}
