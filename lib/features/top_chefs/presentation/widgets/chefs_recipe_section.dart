import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../data/models/recipe/recipe_model.dart';

class ChefsProfileRecipes extends StatelessWidget {
  const ChefsProfileRecipes({
    super.key, required this.text,  this.recipe,
  });
  final String text;
  final RecipeModel? recipe;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 72),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 330.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.redPinkMain,
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.beigeColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          shadowColor: Colors.black.withOpacity(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              recipe!.photo,
              width: double.infinity.w,
              height: 103.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}