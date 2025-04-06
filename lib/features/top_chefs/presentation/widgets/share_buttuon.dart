import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_svg_button.dart';

import '../../../../Core/utils/colors.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20),
      ),
      child: RecipeSvgButton(
        callback: () {},
        svg: "assets/icons/share.svg",
        color: Colors.white,
        height: 10,
        width: 5,
      ),
    );
  }
}
