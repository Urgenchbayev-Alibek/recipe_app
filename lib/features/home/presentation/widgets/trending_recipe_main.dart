import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_svg_image.dart';
import '../../../../core/utils/app_colors.dart';
import 'heart_icon.dart';

class TrendingRecipeMain extends StatelessWidget {
  const TrendingRecipeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "Trending Recipe",
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontSize: 15,
            ),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: -60,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xff2C1A18),
                  border: Border.all(color: Colors.red),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Salami and cheese pizza",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Row(
                          children: [
                            RecipeSvgImage(image: "assets/icons/clock.svg", width: 12, height: 12),
                            const SizedBox(width: 5),
                            const Text(
                              "30min",
                              style: TextStyle(
                                color: AppColors.pinkSub,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "This is a quick overview of the ingredients...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "5",
                              style: TextStyle(
                                color: AppColors.pinkSub,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 5),
                            RecipeSvgImage(image: "assets/icons/star.svg", width: 12, height: 12),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: const Image(
                      image: AssetImage("assets/images/salami_pizza.png"),
                      width: double.infinity,
                      height: 143,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const HeartIcon(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}