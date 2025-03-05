import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../recipe_detail/presentation/widgets/recipe_svg_image.dart';
import 'heart_icon.dart';
class RecentlyAddedItem extends StatelessWidget {
  const RecentlyAddedItem({super.key, required this.title, required this.desc, required this.image});

  final String title;
  final String  desc;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -70,
          child: Container(
            width: 169,
            height: 76,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha:0.9),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: TextStyle(
                      color: AppColors.beigeColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(desc,
                    style: TextStyle(
                      color: AppColors.beigeColor,
                      fontSize: 13,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "4",
                        style: TextStyle(
                          color: AppColors.pinkSub,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 5),
                      RecipeSvgImage(image: "assets/icons/star.svg", width: 10, height: 10),
                      const SizedBox(width: 25),
                      RecipeSvgImage(image: "assets/icons/clock.svg", width: 10, height: 10),
                      const SizedBox(width: 5),
                      const Text(
                        '30min',
                        style: TextStyle(
                          color: AppColors.pinkSub,
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 169,
          height: 153,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: const Stack(
            children: [
              HeartIcon(),
            ],
          ),
        )
      ],
    );
  }
}