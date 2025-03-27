import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';

class YourRecipesBottom extends StatelessWidget {
  final YourRecipesBottomModel foodCardModel;

  const YourRecipesBottom({super.key, required this.foodCardModel});

  @override
  Widget build(BuildContext context) {
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
                  foodCardModel.imagePath,
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
                    foodCardModel.heartIcon,
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
                  foodCardModel.title,
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
                      foodCardModel.starIcon,
                      width: 16,
                      height: 16,
                    ),
                    Text(foodCardModel.rating,style: TextStyle(fontSize:12,color: AppColors.redPinkMain ),),
                    SvgPicture.asset(
                      foodCardModel.timerIcon,
                      width: 16,
                      height: 16,
                    ),
                    Text(foodCardModel.time,style: TextStyle(fontSize:12,color: AppColors.redPinkMain ),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class YourRecipesBottomModel {
  final String imagePath;
  final String title;
  final String time;
  final String rating;
  final String starIcon;
  final String timerIcon;
  final String heartIcon;

  YourRecipesBottomModel({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.time,
    required this.starIcon,
    required this.timerIcon,
    required this.heartIcon,
  });
}