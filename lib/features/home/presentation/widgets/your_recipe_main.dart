import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/home/presentation/widgets/your_recipes_item.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/home_view_model.dart';

class YourRecipeMain extends StatelessWidget {
  const YourRecipeMain({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (vm.yourRecipes.isEmpty) {
      return const Center(child: Text("No recipes found"));
    } else {
      return Container(
        width: double.infinity,
        height: 255,
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18, top: 10),
              child: Text(
                "Your Recipes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: vm.yourRecipes.map((recipe) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: YourRecipesItem(
                        image: recipe.photo,
                        title: recipe.title,
                        rating: recipe.rating,
                        timeRequired: recipe.timeRequired,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
