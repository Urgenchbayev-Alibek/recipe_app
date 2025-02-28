import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_view_app_bar.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeDetailViewAppBar(),
      body: Center(child: FlutterLogo(),),
    );
  }
}
