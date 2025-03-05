import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/widgets/your_recipes_item.dart';
import '../../../../core/utils/app_colors.dart';

class YourRecipeMain extends StatelessWidget {
  const YourRecipeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 255,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18, top: 10),
            child: Text(
              "Your Recipes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                YourRecipesItem(image: "assets/images/chicken_burger.png", title: 'Chicken Burger'),
                const SizedBox(width: 10),
                YourRecipesItem(image: "assets/images/tiramisu.png", title: 'Tiramisu'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
