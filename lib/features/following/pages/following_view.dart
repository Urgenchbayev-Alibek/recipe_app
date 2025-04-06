import 'package:flutter/material.dart';
import 'package:recipe_app/features/common/common.dart';

import '../widgets/follow_view_app_bar.dart';
import '../widgets/follower_part.dart';
import '../widgets/following_part.dart';

class FollowingView extends StatelessWidget {
  FollowingView({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        appBar: FollowViewAppBar(),
        body: TabBarView(
          children: [
            FollowingPart(contr: controller),
            FollowerPart(contr: controller),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
