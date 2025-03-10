import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/home/presentation/widgets/trending_recipe/trending_recipe_bottom.dart';
import '../../../../../core/sizes.dart';
import '../../../../common/recipe_icon_button_container.dart';
import '../../manager/home_view_model.dart';

class TrendingRecipeItemHome extends StatelessWidget {
  const TrendingRecipeItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    var trendingRecipe = context.select((HomeViewModel value) => value.trendingRecipe);
    if (trendingRecipe == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SizedBox(
        width: 358 * AppSizes.wRatio,
        height: 182,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: TrendingRecipeBottom(
                title: trendingRecipe.title,
                desc: trendingRecipe.description,
                rating: trendingRecipe.rating,
                time: trendingRecipe.timeRequired,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 143,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  trendingRecipe.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 7,
              right: 8,
              child: RecipeIconButtonContainer(
                image: "assets/icons/heart.svg",
                callback: () {}, iconWidth: 12, iconHeight: 18,
              ),
            ),
          ],
        ),
      );
    }
  }
}
