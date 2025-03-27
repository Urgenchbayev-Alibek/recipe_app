import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/features/following/presentation/widgets/search_bar_widget.dart';
import 'package:recipe_app/features/following/presentation/widgets/user_list_widget.dart';
import '../../../../Core/utils/colors.dart';
import '../../../common/widgets/recipe_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FollowingScreen(),
    );
  }
}

class FollowingScreen extends StatelessWidget {
  FollowingScreen({super.key});

  final List<Map<String, String>> users = [
    {'username': '@neil_tran', 'name': 'Neil Tran-Chef', 'image': 'assets/images/andrew.png'},
    {'username': '@chef_emily', 'name': 'Emily Carter', 'image': 'assets/images/andrew.png'},
    {'username': '@cia_food', 'name': 'Cia Rodriguez', 'image': 'assets/images/andrew.png'},
    {'username': '@josh_ryan', 'name': 'Josh Ryan-Chef', 'image': 'assets/images/andrew.png'},
    {'username': '@torros_meat', 'name': 'Alfredo Torres', 'image': 'assets/images/andrew.png'},
    {'username': '@dakota_mullen', 'name': 'Dakota Mullen', 'image': 'assets/images/andrew.png'},
    {'username': '@smithchef', 'name': 'William Smith', 'image': 'assets/images/andrew.png'},
    {'username': '@ivanovsmithivan', 'name': 'Ivan Valach', 'image': 'assets/images/andrew.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.redPinkMain),
            onPressed: () {},
          ),
          title: Text('@dianne_r', style: TextStyle(color: AppColors.redPinkMain)),
          centerTitle: false,
          bottom: const TabBar(
            indicatorColor: Colors.pink,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: '120 Following'),
              Tab(text: '250 Followers'),
            ],
          ),
        ),
        body: Column(
          children: [
             SearchBarWidget(),
            Expanded(
              child: TabBarView(
                children: [
                  UserListWidget(users: users),
                  UserListWidget(users: users),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}



