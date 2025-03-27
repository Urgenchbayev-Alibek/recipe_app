
import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'your_recipe_body_model.dart';
import 'your_recipe_bottom_model.dart';

class YourRecipeBody extends StatelessWidget {
  const YourRecipeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 430,
            height: 255,
            color: AppColors.redPinkMain,
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Most Viewed Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    YourRecipesBottom(
                      foodCardModel: YourRecipesBottomModel(
                        imagePath: 'assets/images/tiramisu.png',
                        title: "Chicken Burger",
                        rating: '5',
                        time: '15min',
                        starIcon: 'assets/icons/star.svg',
                        timerIcon: 'assets/icons/timer.svg',
                        heartIcon: 'assets/icons/heart.svg',
                      ),
                    ),
                    SizedBox(width: 10),
                    YourRecipesBottom(
                      foodCardModel: YourRecipesBottomModel(
                        imagePath: 'assets/images/tiramisu.png',
                        title: "Tiramisu",
                        rating: '5',
                        time: '15min',
                        starIcon: 'assets/icons/star.svg',
                        timerIcon: 'assets/icons/timer.svg',
                        heartIcon: 'assets/icons/heart.svg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YourRecipesBody(
              yourRecipesBodyModelModel: YourRecipesBodyModel(
                imagePath: 'assets/images/tiramisu.png',
                title: "Béchamel  Pasta",
                comment: 'A creamy and indulgent',
                rating: '4',
                time: '30min',
                starIcon: 'assets/icons/star.svg',
                timerIcon: 'assets/icons/timer.svg',
                heartIcon: 'assets/icons/heart.svg',
              ),
            ),
            SizedBox(width: 10),
            YourRecipesBody(
              yourRecipesBodyModelModel: YourRecipesBodyModel(
                imagePath: 'assets/images/tiramisu.png',
                title: "Grilled Skewers",
                comment: 'Succulent morsels',
                rating: '4',
                time: '30min',
                starIcon: 'assets/icons/star.svg',
                timerIcon: 'assets/icons/timer.svg',
                heartIcon: 'assets/icons/heart.svg',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
