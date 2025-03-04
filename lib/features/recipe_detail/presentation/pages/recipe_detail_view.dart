import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/routess.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../manager/recipe_detail_view_model.dart';
import '../widgets/recipe_detail_app_bar.dart';
import '../widgets/recipe_detail_chef_info.dart';
import '../widgets/recipe_detail_ingredient_section.dart';
import '../widgets/recipe_detail_instructions_section.dart';
import '../widgets/recipe_detail_mage_info.dart';
import '../widgets/recipe_detail_section.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if(vm.isLoading){
      return Center(child: CircularProgressIndicator());
    }else {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.beigeColor,
        appBar: RecipeDetailAppBar(
          callback: () => context.go(Routes.categoryDetail),
          title: vm.recipe.title,
        ),
        body: ListView(
          padding: EdgeInsets.only(top:100,right: 36, left: 36,bottom: 20),
          children: [
            RecipeDetailImageInfo(),
            SizedBox(
              height: 26,
            ),
            RecipeDetailChefInfo(
              user: vm.recipe.user,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: AppColors.pinkSub,
            ),
            SizedBox(
              height: 31,
            ),
            RecipeDetailDetailsSection(
              desc: vm.recipe.description,
              timeRequired: vm.recipe.timeRequired,
            ),
            SizedBox(
              height: 31,
            ),
            RecipeDetailIngredientsSection(ingredients: vm.recipe.ingredients,),
            SizedBox(height: 31,),
            RecipeDetailInstructionsSection(instruction:  vm.recipe.instructions,)
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}
