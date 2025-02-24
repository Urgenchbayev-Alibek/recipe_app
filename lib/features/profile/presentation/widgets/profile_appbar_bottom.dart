import 'package:flutter/material.dart';
import 'package:recipe_app/features/profile/presentation/widgets/profile_appbar_bottom_stats.dart';
import '../pages/profile_view_model.dart';
import 'bottom_buttons_row.dart';
import 'bottom_tabbar.dart';

class ProfileAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileAppBarBottom({
    super.key,
    required this.vm,
  });

  final ProfileViewModel vm;

  @override
  Size get preferredSize => Size(double.infinity, double.infinity);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bottom_buttons_row(),
        SizedBox(height: 6),
        ProfileAppBarBottomStats(vm: vm),
        SizedBox(height: 18),
        BottomTabBar(),
      ],
    );
  }
}
