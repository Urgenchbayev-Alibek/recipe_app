import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/app_colors.dart';

class ProfileAppBarActionContainer extends StatelessWidget {
  const ProfileAppBarActionContainer({super.key, required this.svg});

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.Pink,
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(svg),
    );
  }
}
