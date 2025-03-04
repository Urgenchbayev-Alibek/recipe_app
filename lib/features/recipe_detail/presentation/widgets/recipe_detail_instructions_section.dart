import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_detail/data/models/instructions_model.dart';
import '../../../../core/utils/app_colors.dart';


class RecipeDetailInstructionsSection extends StatelessWidget {
  const RecipeDetailInstructionsSection({
    super.key, required this.instruction,
  });
  final List<Instruction> instruction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 11,
      children: [
        Text(
          "${instruction.length} Easy Steps",
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 11),
        for (int i = 0; i < instruction.length; i++)
          Container(
            height: 81,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: i % 2 == 0 ? AppColors.pinkSub : AppColors.pink,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "${i + 1}. ${instruction[i].text}",
              style: TextStyle(color: Colors.black),
            ),
          ),
      ],
    );
  }
}