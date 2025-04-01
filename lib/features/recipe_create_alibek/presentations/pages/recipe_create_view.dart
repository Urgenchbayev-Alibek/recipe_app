import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/Core/utils/colors.dart';
import 'package:recipe_app/features/common/common.dart';

class RecipeCreateView extends StatelessWidget {
  const RecipeCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(title: "Create Recipe", actions: null),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 171.w,
                  height: 23.h,
                  decoration: BoxDecoration(color: AppColors.pink, borderRadius: BorderRadius.circular(14)),
                  child: Text(
                    "Publish",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.pinkSub,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 171.w,
                  height: 23.h,
                  decoration: BoxDecoration(color: AppColors.pink, borderRadius: BorderRadius.circular(14)),
                  child: Text(
                    "Delete",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.pinkSub,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
          Form(
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(fillColor: AppColors.pink),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
