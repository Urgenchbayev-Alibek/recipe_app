import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../common/widgets/recipe_bottom_navigation_bar.dart';
import '../widgets/notification.dart';
import '../widgets/notification_app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
    backgroundColor: AppColors.beigeColor,
    appBar: NotificationAppBar(),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationList(),
        ],
      ),
    ),
    bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
