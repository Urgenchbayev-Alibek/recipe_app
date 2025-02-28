import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/utils/app_colors.dart';

import '../manager/categories_view_model.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.cvm});

  final CategoriesViewModel cvm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cvm,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            leading: Center(
              child: SvgPicture.asset(
                "assets/icons/back-arrow.svg",
              ),
            ),
            title: Text(
              "Categories",
              style: TextStyle(color: AppColors.redPinkMain),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: cvm.categories.length,
                  itemBuilder: (context, index) {
                    return category_item(
                      cvm: cvm,
                      index: index,
                      image: cvm.categories[index].image,
                      text: cvm.categories[index].title,
                    );
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                GoRouter.of(context).go('/profile');
              }, child: Text('data'))
            ],
          ),
        );
      },
    );
  }
}
