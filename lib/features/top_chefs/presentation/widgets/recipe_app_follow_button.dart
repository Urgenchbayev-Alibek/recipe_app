import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/colors.dart';
import '../../../../core/presentation/widgets/recipe_app_text.dart';

class RecipeAppFollowButton extends StatelessWidget {
  const RecipeAppFollowButton({
    super.key,
    this.width = 81,
    this.height = 20,
    this.backColor = AppColors.pinkColor,
    this.textColor = AppColors.pink,
    this.fontSize = 11,
    this.text = "Following",
    this.weight = FontWeight.w400,
    required this.callback,
  });

  final double width, height, fontSize;
  final String text;
  final Color backColor, textColor;
  final FontWeight weight;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: width.w,
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(
            width / 2,
          ),
        ),
        child: RecipeAppText(
          data: text,
          color: textColor,
          size: fontSize.sp,
          weight: weight,
        ),
      ),
    );
  }
}
// class RecipeAppFollowButton<T extends dynamic> extends StatelessWidget {
//   const RecipeAppFollowButton({
//     super.key,
//     this.width = 81,
//     this.height = 19,
//     this.backColor = AppColors.pinkColor,
//     this.textColor = AppColors.pinkSub,
//     this.fontSize = 11,
//    required this.text ,
//     this.weight = FontWeight.w400,
//     required this.user,
//   });
//
//   final double width, height, fontSize;
//   final String text;
//   final T user;
//   final Color backColor, textColor;
//   final FontWeight weight;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FollowBloc, FollowState>(
//       builder: (context, state) => GestureDetector(
//         onTap: () {
//           if (state.followUserStatus == FollowStatus.loading) return;
//           context.read<FollowBloc>().add(FollowUser(userId: getUserId(user)));
//         },
//         child: Container(
//           width: width.w,
//           height: height.h,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: backColor,
//             borderRadius: BorderRadius.circular(width / 2),
//           ),
//           child: RecipeAppText(
//             data: state.followUserStatus == FollowStatus.success ? '${text}ed':'${text}ing',
//             color: textColor,
//             size: fontSize.sp,
//             weight: weight,
//           ),
//         ),
//       ),
//     );
//   }
//
//   int getUserId(T user) {
//     if (user is TopChefModel) {
//       return user.id;
//     } else if (user is ProfileModel) {
//       return user.id;
//     } else {
//       throw Exception("Unsupported user model: ${user.runtimeType}");
//     }
//   }
// }

