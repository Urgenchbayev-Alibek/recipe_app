import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'notification_model.dart';



// class RecipeCard extends StatelessWidget {
//   final TrendingRecipeModel recipe;
//
//   RecipeCard({required this.recipe});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(18),
//             child: Image.asset(
//               recipe.day,
//               width: 151,
//               height: 150,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(width: 0),
//           Container(
//             width: 207,
//             height: 122,
//             padding: EdgeInsets.all(8.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   blurRadius: 5,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   recipe.title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   recipe.description,
//                   style: TextStyle(fontSize: 12, color: Colors.black),
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   recipe.name,
//                   style: TextStyle(fontSize: 12, color: AppColors.redPinkMain),
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       recipe.time,
//                       style: TextStyle(fontSize: 12, color: AppColors.redPinkMain),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Text(
//                       recipe.rating,
//                       style: TextStyle(fontSize: 12, color: AppColors.redPinkMain),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class NotificationBody extends StatelessWidget {
  final NotificationModel notifications;

  const NotificationBody({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                notifications.day,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 355,
              height: 75,
              color: AppColors.pink,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 45,
                        height: 45,
                        color: Colors.white,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/star.svg',
                            width: 26,
                            height: 27,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notifications.title,
                          style: TextStyle(color: AppColors.redPinkMain, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          notifications.description,
                          style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                notifications.time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
