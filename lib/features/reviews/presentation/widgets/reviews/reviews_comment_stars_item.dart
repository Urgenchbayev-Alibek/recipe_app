import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/colors.dart';

class ReviewsCommentStarsItem extends StatelessWidget {
  const ReviewsCommentStarsItem({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: List.generate(
        5,
        (index) {
          if (rating > index) {
            return SvgPicture.asset(
              width: 16,
              height: 16,
              "assets/icons/star.svg",
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.redPinkMain,
                BlendMode.srcIn,
              ),
            );
          } else {
            return SvgPicture.asset(
              width: 16,
              height: 16,
              "assets/icons/star-empty.svg",
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.redPinkMain,
                BlendMode.srcIn,
              ),
            );
          }
        },
      ),
    );
  }
}
