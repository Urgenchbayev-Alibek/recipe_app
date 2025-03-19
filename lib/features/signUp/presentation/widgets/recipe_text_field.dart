import 'package:flutter/material.dart';

import '../../../../core/sizes.dart';
import '../../../../core/utils/colors.dart';

class RecipeTextField extends StatelessWidget {
  const RecipeTextField({super.key, required this.text, required this.validator, required this.controller, required this.title});

  final String text, title;
  final String? Function(String? value) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(
          width: 357 * AppSizes.wRatio,
          child: TextFormField(
            validator: validator,
            controller: controller,
            style: TextStyle(
              height: 1,
              color: AppColors.pinkSub,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.pink,
                hintText: text,
                hintStyle: TextStyle(color: AppColors.pinkSub.withValues(alpha: 0.45), fontWeight: FontWeight.w500, fontSize: 16, height: 1),
                contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(18),
                )),
          ),
        ),
      ],
    );
  }
}
