import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/data/models/top_chef_model_small.dart';
import 'package:recipe_app/features/home/presentation/widgets/top_chef_item_home.dart';

import '../../../../core/sizes.dart';
import '../manager/home_view_model.dart';

class TopChefsSectionHome extends StatelessWidget {
  const TopChefsSectionHome({super.key});

  @override
  Widget build(BuildContext context) {
    var topChefs = context.select<HomeViewModel, List<TopChefModelSmall>>((vm) => vm.topChefsHome);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 9,
        children: [
          Text(
            "Top Chefs",
            style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var chef in topChefs) TopChefItemHome(chef: chef),
            ],
          ),
        ],
      ),
    );
  }
}
