import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/models/top_chef_model_small.dart';
import 'package:recipe_app/features/home/presentation/widgets/top_chef_item_home.dart';

class TopChefsSection extends StatelessWidget {
  const TopChefsSection({
    super.key,
    required this.topChefs,
  });

  final List<TopChefModelSmall> topChefs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Chef",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              topChefs.length,
              (index) => TopChefItemHome(topChef: topChefs[index]),
            ),
          ),
        ],
      ),
    );
  }
}
