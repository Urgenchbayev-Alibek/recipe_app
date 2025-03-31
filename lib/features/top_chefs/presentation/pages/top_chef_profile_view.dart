import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Core/utils/colors.dart';
import '../../../common/widgets/recipe_bottom_navigation_bar.dart';
import '../widgets/top_chef_profile_item.dart';

class TopChefProfileView extends StatelessWidget {
  const TopChefProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.beigeColor,
        appBar: AppBar(
          backgroundColor: AppColors.beigeColor,
          leading: Padding(
            padding: EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              'assets/icons/vector.svg',
              width: 24,
              height: 14,
            ),
          ),
          title: Text(
            '@Neil_tran',
            style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: AppColors.pink,
              radius: 14,
              child: SvgPicture.asset(
                'assets/icons/share.svg',
                colorFilter:
                ColorFilter.mode(AppColors.redPinkMain, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: AppColors.pink,
              radius: 14,
              child: SvgPicture.asset(
                'assets/icons/three_dots.svg',
                colorFilter:
                ColorFilter.mode(AppColors.redPinkMain, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 25),
                ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image(
                      image: AssetImage('assets/images/neil_tran.png'),
                      width: 102,
                      height: 97,
                    )),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Neil Tran-Chef',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      'Passionate chef in creative and \ncontemporary cuisine.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 81,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Following',
                          style: TextStyle(
                              color: AppColors.redPinkMain, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 356,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.redPinkMain),
                color: AppColors.beigeColor,

                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('15\nRecipes', style: TextStyle(color: Colors.white)),
                  Text('10\nFollowing', style: TextStyle(color: Colors.white)),
                  Text('255.770\nFollowers',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 6),
            Column(
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.redPinkMain,
                  tabs: [
                    Tab(
                      child: Text(
                        "Recipes",

                        style: TextStyle(color:Colors.white),

                      ),
                    ),
                  ],

                ),
                SizedBox(height: 10),
                TopChefProfileItem(
                  title: "Vegan Recipes",
                  image: 'assets/images/vegan.png',
                ),
                SizedBox(height: 30),
                TopChefProfileItem(
                  title: 'Asian Heritage',
                  image: 'assets/images/asian.png',
                ),
                SizedBox(height: 30),
                TopChefProfileItem(
                    title: 'Guilty Pleasures',
                    image: 'assets/images/guilty.png')
              ],
            ),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}

