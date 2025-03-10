import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/date_formatter.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/sizes.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/community_view_model.dart';

class OldestRecipes extends StatelessWidget {
  const OldestRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CommunityViewModel>();
    final oldestRecipes = vm.oldestRecipes;

    if (oldestRecipes.isEmpty) {
      return Center(
        child: Text(
          "No old recipes available",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      itemCount: oldestRecipes.length,
      itemBuilder: (context, index) {
        final recipe = oldestRecipes[index];

        return Column(
          children: [
            GestureDetector(
              onTap: () => context
                  .push('${Routes.recipeDetail}/${vm.oldestRecipes[index].id}'),
              child: Container(
                width: 356.w,
                height: 319.h,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: CachedNetworkImage(
                            imageUrl: recipe.user.profilePhoto,
                            height: 35,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@${recipe.user.username}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            ),
                            Text(
                              formatDate(recipe.created),
                              style: TextStyle(
                                  color: AppColors.redPinkMain,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 365.w,
                          height: 250.h,
                          decoration: BoxDecoration(
                            color: AppColors.redPinkMain,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: recipe.photo,
                            width: 356.w,
                            height: 173.h,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 356.w,
                              height: 173.h,
                              color: Colors.grey[200],
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Positioned(
                          top: 173,
                          left: 15,
                          right: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        recipe.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      SvgPicture.asset(
                                        "assets/icons/star.svg",
                                        height: 10,
                                        color: Colors.white,
                                      ),
                                      Text(recipe.rating.toString()),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 258.w,
                                    child: Text(
                                      recipe.description,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/clock.svg",
                                        color: Colors.white,
                                        height: 10,
                                      ),
                                      Text("${recipe.timeRequired} min"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(recipe.reviewsCount.toString()),
                                      SvgPicture.asset(
                                          "assets/icons/comment.svg")
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(color: AppColors.redPinkMain),
          ],
        );
      },
    );
  }
}
