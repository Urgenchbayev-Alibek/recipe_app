// import 'package:flutter/material.dart';
// import 'package:recipe_app/core/utils/colors.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class NotificationBody extends StatelessWidget {
//   const NotificationBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(18),
//       child: Container(
//         width: 430,
//         height: 255,
//         color: AppColors.redPinkMain,
//         padding: EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Most Viewed Today",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildFoodCard(
//                   imagePath: 'assets/images/tiramisu.png',
//                   title: "Chicken Burger",
//                   starIcon: 'assets/icons/star.svg',
//                   timerIcon: 'assets/icons/timer.svg',
//                   heartIcon: 'assets/icons/heart.svg',
//                 ),
//                 SizedBox(width: 10),
//                 _buildFoodCard(
//                   imagePath: 'assets/images/tiramisu.png',
//                   title: "Tiramisu",
//                   starIcon: 'assets/icons/star.svg',
//                   timerIcon: 'assets/icons/timer.svg',
//                   heartIcon: 'assets/icons/heart.svg',
//                 ),
//               ],
//             ),
//
//           ],
//         ),
//       ),
//
//     );
//
//   }
//
//   Widget _buildFoodCard({
//     required String imagePath,
//     required String title,
//     required String starIcon,
//     required String timerIcon,
//     required String heartIcon,
//   }) {
//     return Container(
//       width: 170,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 5,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(18),
//                 child: Image.asset(
//                   imagePath,
//                   width: 170,
//                   height: 120,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   padding: EdgeInsets.all(6),
//                   decoration: BoxDecoration(
//                     color: AppColors.redPinkMain,
//                     shape: BoxShape.circle,
//                   ),
//                   child: SvgPicture.asset(
//                     heartIcon,
//                     width: 20,
//                     height: 20,
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding:  EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset(
//                       starIcon,
//                       width: 16,
//                       height: 16,
//                     ),
//                     Text(" 5  "),
//                     SvgPicture.asset(
//                       timerIcon,
//                       width: 16,
//                       height: 16,
//                     ),
//                     Text(" 15min"),
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
import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 430,
            height: 255,
            color: AppColors.redPinkMain,
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Most Viewed Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFoodCard(
                      imagePath: 'assets/images/tiramisu.png',
                      title: "Chicken Burger",
                      starIcon: 'assets/icons/star.svg',
                      timerIcon: 'assets/icons/timer.svg',
                      heartIcon: 'assets/icons/heart.svg',
                    ),
                    SizedBox(width: 10),
                    _buildFoodCard(
                      imagePath: 'assets/images/tiramisu.png',
                      title: "Tiramisu",
                      starIcon: 'assets/icons/star.svg',
                      timerIcon: 'assets/icons/timer.svg',
                      heartIcon: 'assets/icons/heart.svg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20), // Pink containerdan keyin chiqib turishi uchun
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFoodCard(
              imagePath: 'assets/images/tiramisu.png',
              title: "Chicken Burger",
              starIcon: 'assets/icons/star.svg',
              timerIcon: 'assets/icons/timer.svg',
              heartIcon: 'assets/icons/heart.svg',
            ),
            SizedBox(width: 10),
            _buildFoodCard(
              imagePath: 'assets/images/tiramisu.png',
              title: "Tiramisu",
              starIcon: 'assets/icons/star.svg',
              timerIcon: 'assets/icons/timer.svg',
              heartIcon: 'assets/icons/heart.svg',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFoodCard({
    required String imagePath,
    required String title,
    required String starIcon,
    required String timerIcon,
    required String heartIcon,
  }) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  imagePath,
                  width: 170,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.redPinkMain,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    heartIcon,
                    width: 20,
                    height: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      starIcon,
                      width: 16,
                      height: 16,
                    ),
                    Text(" 5  "),
                    SvgPicture.asset(
                      timerIcon,
                      width: 16,
                      height: 16,
                    ),
                    Text(" 15min"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLowerFoodCard({required String imagePath}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            imagePath,
            width: 170,
            height: 153,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 129,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: AppColors.redPinkMain, // Pushti chegara
              width: 2,
            ),
          ),
        ),
      ],
    );
  }
}

