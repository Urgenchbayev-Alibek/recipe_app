import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/presentation/widgets/recently_added_item.dart';
import '../../../../core/utils/app_colors.dart';


class RecentlyAddedMain extends StatelessWidget {
  const RecentlyAddedMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                "Recently Added",
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 1),
            RecentlyAddedItem(title: "Lemonade", desc: "Acidic and refreshing", image: "assets/images/barbecue.png"),
            RecentlyAddedItem(title: "Lemonade", desc: "Acidic and refreshing", image: "assets/images/mojito.png")
          ],
        )
      ],
    );
  }
}


