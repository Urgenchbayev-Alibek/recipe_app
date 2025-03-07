import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../recipe_detail/presentation/widgets/recipe_svg_image.dart';
import 'heart_icon.dart';

class YourRecipesItem extends StatelessWidget {
  const YourRecipesItem({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.timeRequired,
  });

  final String image, title;
  final num rating;
  final num timeRequired;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          child: Image.network(
            image,
            width: 169,
            height: 162,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Text("Image not found"));
            },
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
              borderRadius: BorderRadius.all(Radius.circular(14)),
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
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: AppColors.pinkSub,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 3),
                      RecipeSvgImage(
                          image: "assets/icons/star.svg", width: 10, height: 10),
                      const SizedBox(width: 30),
                      RecipeSvgImage(
                          image: "assets/icons/clock.svg", width: 10, height: 10),
                      const SizedBox(width: 4),
                      Text(
                        '$timeRequired min',
                        style: const TextStyle(
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
