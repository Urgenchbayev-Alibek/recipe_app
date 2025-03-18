import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../common/recipe_app_bar.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../manager/create_review/create_review_bloc.dart';
import '../manager/create_review/create_review_state.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: "Leave A Review", actions: null),
      body: ListView(
        padding: EdgeInsets.fromLTRB(36.w, 0, 36.w, 120.h),
        children: [
          BlocBuilder<CreateReviewBloc, CreateReviewState>(
              builder: (context, state) => Column(
                    spacing: 3,
                    children: [
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) {
                            return SizedBox(
                              width: 29,
                              height: 29,
                              child: SvgPicture.asset(
                                "assets/icons/star${index <= (state.currentIndex ?? -1) ? 'filled' : 'empty'}.svg",
                                colorFilter: ColorFilter.mode(AppColors.redPinkMain, BlendMode.srcIn),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )),
          SizedBox(height: 30),
          TextField(
            minLines: 3,
            maxLines: 5,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Leave us Review",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.45),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: AppColors.pink,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
