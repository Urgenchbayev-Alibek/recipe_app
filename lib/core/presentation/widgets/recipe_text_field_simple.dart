import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class RecipeTextFieldSimple extends StatelessWidget {
  const RecipeTextFieldSimple({
    super.key,
    required this.validator,
    required this.controller,
    required this.width,
    required this.height,
    required this.hint,
    this.isCenter=true,
    this.textColor,
  });

  final TextEditingController controller;

  final String? Function(String? value) validator;
  final double width, height;
  final String hint;
  final bool isCenter;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        validator: validator,
        controller: controller,
        textAlign:isCenter?TextAlign.center: TextAlign.start,
        style: TextStyle(
          color: AppColors.beigeColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.pinkColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: BorderSide.none),
            hintText: hint,
            hintStyle: TextStyle(
              color: textColor ?? AppColors.beigeColor.withValues(alpha: 0.50),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w)),
      ),
    );
  }
}
