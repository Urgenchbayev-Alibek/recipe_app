import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';

class AppBarActionContainer extends StatelessWidget {
  const AppBarActionContainer({super.key, required this.svg});

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(svg, width: 20, height: 20),
    );
  }
}
