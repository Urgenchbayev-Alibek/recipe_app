import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/presentation/widgets/recipe_app_text.dart';
import '../../common/widgets/recipe_app_bar.dart';
import '../manager/following_event.dart';
import '../manager/following_state.dart';

class FollowViewAppBar extends StatelessWidget implements PreferredSizeWidget{
  const FollowViewAppBar({
    super.key,
  });
@override
  Size get preferredSize => Size(double.infinity, 120.h);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingBloc,FollowState>(
      builder:(context, state) =>  switch(state.followingStatus) {
        null => throw UnimplementedError(),
        FollowStatus.idle => throw UnimplementedError(),
        FollowStatus.success => RecipeAppBar(
          title:"@zor" ,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              RecipeAppText(
                data: "${state.followings!.length} Following",
                color: Colors.white,
                size: 15.sp,
              ),
              RecipeAppText(
                data: "${state.followers!.length} Follower",
                color: Colors.white,
                size: 15.sp,
              ),
            ],
          ),
          actions: [],
        ),
        FollowStatus.loading => Center(child: CircularProgressIndicator(),),
        FollowStatus.error => throw UnimplementedError(),
      },
    );
  }
}
