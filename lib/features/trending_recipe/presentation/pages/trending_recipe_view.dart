import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_svg_button.dart';
import 'package:recipe_app/features/common/common.dart';

import '../../../../core/presentation/widgets/recipe_app_text.dart';
import '../../../../core/presentation/widgets/recipe_image_with_like.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/sizes.dart';
import '../../../../core/utils/colors.dart';
import '../../../../data/models/recipe/recipe_model.dart';
import '../manager/trending_recipe_bloc.dart';
import '../manager/trending_recipe_state.dart';
import '../widgets/recipe_trend_main.dart';

class TrendingRecipeView extends StatelessWidget {
  const TrendingRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Trending Recipes",
        actions: [
        ],
      ),
      body: Column(
        children: [
          RecipeTrendMain(),
          BlocBuilder<TrendingRecipeBloc, TrendingRecipesState>(
            builder: (context, state) {
              final recipes = state.trendRecipes;
              switch (state.recipeStatus) {
                case null:
                  return Text("xato bor null");

                case TrendingStatus.idle:
                  return Text("xato bor idleda");

                case TrendingStatus.load:
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                case TrendingStatus.error:
                  return Text("xato bor errorda");

                case TrendingStatus.success:
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(36.w, 20.h, 36.w, 150.h),
                      itemCount: recipes!.length,
                      separatorBuilder: (context, index) => SizedBox(height: 15.h),
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return SizedBox(
                          width: 358.w,
                          height: 150.h,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RecipeImageWithLike<List<RecipeModel>>(
                                  recipe: recipes,
                                  getPhotoUrl: (recipe) => recipe[index].photo,
                                  width: 151.w,
                                  height: 150.h,
                                  shadow: false,
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    context.push(
                                      Routes.getRecipeDetail(recipe.id),
                                    ),
                                child: Container(
                                  width: 207.w,
                                  height: 122.h,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(14),
                                    ),
                                    border: Border.all(color: AppColors.pinkSub, width: 1),
                                  ),
                                  child: Column(
                                    spacing: 6.h,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RecipeAppText(
                                        data: recipe.title,
                                        color: Colors.black,
                                        size: 12.sp,
                                        line: 1,
                                        height: 1,
                                      ),
                                      RecipeAppText(
                                        data: recipe.description,
                                        color: Colors.black,
                                        size: 13.sp,
                                        line: 2,
                                        // height: 1,
                                        font: false,
                                        weight: FontWeight.w300,
                                      ),
                                      RecipeAppText(
                                        data: "By chef ${recipe.categoryId}",
                                        color: AppColors.redPinkMain,
                                        size: 12.sp,
                                        line: 1,
                                        height: 1,
                                        font: true,
                                        weight: FontWeight.w300,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          RecipeRating(rating: recipe.rating),
                                          Row(
                                            children: [
                                              RecipeAppText(
                                                data: "Easy",
                                                color: AppColors.pinkSub,
                                                size: 12.sp,
                                                weight: FontWeight.w300,
                                              ),
                                              RecipeSvgButton(
                                                callback: () {},
                                                svg: 'assets/icons/level.svg',
                                                width: 13.w,
                                                height: 10.h,
                                                color: AppColors.pinkSub,
                                              ),
                                            ],
                                          ),
                                          RecipeTime(timeRequired: recipe.timeRequired),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
              }
            },
          )
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
