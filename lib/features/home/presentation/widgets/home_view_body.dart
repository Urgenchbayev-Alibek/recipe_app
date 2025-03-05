import 'package:flutter/material.dart';

import 'recently_added_main.dart';
import 'top_chef_main.dart';
import 'trending_recipe_main.dart';
import 'your_recipe_main.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 160),
      children: const [
        SizedBox(height: 15),
        TrendingRecipeMain(),
        SizedBox(height: 80),
        YourRecipeMain(),
        SizedBox(height: 10),
        TopChefMain(),
        SizedBox(height: 15),
        RecentlyAddedMain(),
      ],
    );
  }
}