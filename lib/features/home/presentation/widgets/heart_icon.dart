import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
class HeartIcon extends StatelessWidget {
  const HeartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        height: 28,
        width: 28,
        decoration: const BoxDecoration(
          color: AppColors.pinkSub,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/heart.svg",
            width: 15,
            height: 15,
          ),
        ),
      ),
    );
  }
}