import 'package:flutter/material.dart';

import '../manager/categories_view_model.dart';

// ignore: camel_case_types
class category_item extends StatelessWidget {
  const category_item({
    super.key,
    required this.cvm,
    required this.index, required this.image, required this.text,
  });

  final int index;
  final CategoriesViewModel cvm;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
            cvm.categories[index].image,
            width: 158,
            height: 145,
            fit: BoxFit.cover,
          ),
        ),
        Text(cvm.categories[index].title),
      ],
    );
  }
}
