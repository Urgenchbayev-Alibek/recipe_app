import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class RecipeIngredientItem extends StatelessWidget {
  const RecipeIngredientItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: 6),
          SizedBox(
            width: 300,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}