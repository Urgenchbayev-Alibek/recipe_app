import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/widgets/top_chef_item.dart';
import '../../../../core/utils/app_colors.dart';

class TopChefMain extends StatelessWidget {
  const TopChefMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            "Top Chef",
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TopChefItem(image: "assets/images/joseph.png", name: "Joseph"),
            TopChefItem(image: "assets/images/andrew.png", name: 'Andrew'),
            TopChefItem(image: "assets/images/emily.png", name: 'Emily'),
            TopChefItem(image: "assets/images/jessica-davis.png", name: 'Jessica'),
          ],
        )
      ],
    );
  }
}


