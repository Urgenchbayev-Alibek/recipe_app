import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../recipe_detail/presentation/widgets/recipe_svg_image.dart';
import 'heart_icon.dart';
class YourRecipesItem extends StatelessWidget {
  const YourRecipesItem({super.key, required this.image, required this.title});

  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          child: Image(
            image: AssetImage(image),
            width: 169,
            height: 162,
            fit: BoxFit.cover,
          ),
        ),
        const HeartIcon(),
        Positioned(
          bottom: -25,
          left: 0,
          child: Container(
            width: 169,
            height: 49,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.beigeColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Text(
                        "5",
                        style: TextStyle(color: AppColors.pinkSub, fontSize: 12),
                      ),
                      const SizedBox(width: 3),
                      RecipeSvgImage(image: "assets/icons/star.svg", width: 10, height: 10),
                      const SizedBox(width: 30),
                      RecipeSvgImage(image: "assets/icons/clock.svg", width: 10, height: 10),
                      const SizedBox(width: 4),
                      const Text(
                        '15min',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.pinkSub,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}