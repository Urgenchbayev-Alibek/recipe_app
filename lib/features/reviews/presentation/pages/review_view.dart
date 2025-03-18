import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/common/recipe_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../manager/reviews/reviews_bloc.dart';
import '../manager/reviews/reviews_state.dart';
import '../widgets/reviews/reviews_view_comment.dart';
import '../widgets/reviews/reviews_view_recipe.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: "Reviews", actions: null),
      body: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          if (state.status == ReviewsStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == ReviewsStatus.error) {
            return Center(child: Text("Something went wrong"));
          } else if (state.status == ReviewsStatus.idle) {
            return RefreshIndicator(
              onRefresh: () async => context.read<ReviewsBloc>().add(
                    ReviewsLoading(
                      recipeId: state.recipeModel!.id,
                    ),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewsViewRecipe(
                    recipe: state.recipeModel!,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 20.h),
                    child: Text(
                      "Comments",
                      style: TextStyle(
                        color: AppColors.redPinkMain,
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: true,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 37.w),
                      itemCount: state.comments.length,
                      separatorBuilder: (context, index) => SizedBox(height: 11),
                      itemBuilder: (context, index) => ReviewsViewComment(
                        comment: state.comments[index],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
