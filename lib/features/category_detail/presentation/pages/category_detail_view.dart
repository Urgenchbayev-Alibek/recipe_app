import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/recipe_app_bar.dart';
import '../../../common/recipe_app_bar_bottom.dart';
import '../../../common/recipe_app_bar_navigation_bar.dart';
import '../../../common/recipe_icon_button_container.dart';
import '../manager/category_detail_view_model.dart';
import 'category_detail_view_body.dart';
class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CategoryDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
            title: vm.selected.title,
            actions: [
              RecipeIconButtonContainer(
                image: "assets/icons/notification.svg",
                iconWidth: 14,
                iconHeight: 19,
                callback: () {},
              ),
              SizedBox(width: 5),
              RecipeIconButtonContainer(
                image: "assets/icons/search.svg",
                iconWidth: 12,
                iconHeight: 18,
                callback: () {},
              ),
            ],
            bottom: RecipeAppBarBottom()
        ),
        body: CategoryDetailViewBody(),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}