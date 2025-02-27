import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class RecipeElevatedButton extends StatelessWidget {
  const RecipeElevatedButton({
    super.key,
    this.size = const Size(207, 45),
    this.foregroundColor = AppColors.PinkSub,
    this.backGroundColor = AppColors.ReddishPink,
    this.fontSize = 20,
    this.elevation = 0,
    required this.text,
    required this.callback,
  });

  final Size size;
  final VoidCallback callback;
  final String text;
  final Color foregroundColor, backGroundColor;
  final double fontSize;
  final double elevation;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: size,
        child: ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backGroundColor,
            fixedSize: size,
            elevation:  elevation,
          ),
          child: Text(text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }
}
