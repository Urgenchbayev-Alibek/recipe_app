import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeSvgButton extends StatelessWidget {
  final String svg;

  const RecipeSvgButton({
    super.key,
    required this.svg,
    required this.width,
    required this.height,
    this.color = Colors.white,
    required this.callback,
    this.blend=true,
    this.sizeHeight=27,
    this.sizeWidth=30,
  });

  final double width, height;
  final Color color;
  final VoidCallback callback;
  final bool blend;
  final double sizeHeight,sizeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeHeight,
      width: sizeWidth,
      child: IconButton(
        onPressed: callback,
        padding: EdgeInsets.zero,
        icon: Center(
          child: SvgPicture.asset(
            svg,
            width: width,
            height: height,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              color,
              blend ? BlendMode.srcIn :BlendMode.srcOut,
            ),
          ),
        ),
      ),
    );
  }
}
