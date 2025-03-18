import 'package:flutter/material.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews/reviews_comment_stars_item.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews/reviews_comment_user_item.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../data/models/review_model/review_comment_model.dart';
import '../../manager/reviews/reviews_bloc.dart';

class ReviewsViewComment extends StatelessWidget {
  const ReviewsViewComment({
    super.key,
    required this.comment,
  });

  final ReviewCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewsCommentUserItem(
            user: comment.user,
            created: ReviewsBloc.sinceCreated(
              createdText: comment.created.toString(),
            )),
        Text(
          comment.comment,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
          softWrap: true,
          maxLines: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReviewsCommentStarsItem(rating: comment.rating.toInt()),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.redPinkMain,
                    decorationThickness: 1.5,
                    decorationStyle: TextDecorationStyle.solid
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Divider(
          height: 1,
          color: AppColors.pinkSub,
        )
      ],
    );
  }
}
