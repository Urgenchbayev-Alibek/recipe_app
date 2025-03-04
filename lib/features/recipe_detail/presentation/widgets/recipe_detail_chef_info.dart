import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_detail/data/models/user_model_small.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_svg_image.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../signUp/data/models/user_model.dart';

class RecipeDetailChefInfo extends StatelessWidget {
  const RecipeDetailChefInfo({
    super.key, required this.user,
  });
  final UserModelInRecipe user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(31),
              child: Image(
                image: NetworkImage(user.profilePhoto),
                width: 62,
                height: 62,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15,),
            Column(
              children: [
                Text(user.username,
                  style: TextStyle(
                      color: AppColors.redPinkMain,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Text(user.fullName,
                  style: TextStyle(
                      color: AppColors.redPinkMain,
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 21,
              child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.pinkSub,
                    backgroundColor: AppColors.pink,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 15)
                ),
                child: Text("Following",
                  style:TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ),

            SizedBox(width: 9,),
            RecipeSvgImage(image: 'assets/svg/three_dots',
                width:4 ,
                height: 15)
          ],
        )
      ],
    );
  }
}