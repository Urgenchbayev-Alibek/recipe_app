import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeAppSvgPicture extends StatelessWidget {
  const RecipeAppSvgPicture({
    super.key,
    required this.svg,
     this.width=10,
     this.height=10,
    this.color=Colors.white,
  });

  final String svg;
  final double width, height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      width: width.w,
      height: height.h,
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
