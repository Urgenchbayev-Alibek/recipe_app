import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/community/presentation/widgets/community_app_bar_bottom.dart';
import 'package:recipe_app/features/community/presentation/widgets/community_view_body.dart';

import '../../../common/widgets/recipe_app_bar.dart';
import '../../../common/widgets/recipe_bottom_navigation_bar.dart';
import '../../../common/widgets/recipe_icon_button_container.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Community",
        actions: [
          RecipeIconButtonContainer(
            image: 'assets/icons/notification.svg',
            callback: () {
              context.push(Routes.notification);
            },
            iconWidth: 14,
            iconHeight: 19,
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: 'assets/icons/search.svg',
            callback: () {},
            iconWidth: 14,
            iconHeight: 19,
          ),
        ],
        bottom: CommunityAppBarBottom(),
      ),
      body: CommunityViewBody(),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
