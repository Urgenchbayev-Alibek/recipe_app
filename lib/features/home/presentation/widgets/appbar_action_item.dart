import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/app_colors.dart';

class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          height: 28,
          width: 28,
          decoration: const BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
              width: 18,
              height: 18,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 28,
          width: 28,
          decoration: const BoxDecoration(
            color: Color(0xffFFC6C9),
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              width: 18,
              height: 18,
            ),
          ),
        ),
      ],
    );
  }
}