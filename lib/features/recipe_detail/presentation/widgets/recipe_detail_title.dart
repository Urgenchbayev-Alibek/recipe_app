import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_reviews.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../common/recipe_rating.dart';

class RecipeDetailTitle extends StatelessWidget {
  const RecipeDetailTitle({
    super.key, required this.title, required this.rating, required this.reviews,
  });
  final String title;
  final num rating;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 357,
        height: 337,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
            color: AppColors.redPinkMain,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    RecipeRating(
                      rating: rating,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      swap: true,
                    ),
                    RecipeReviews(reviews: reviews),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}