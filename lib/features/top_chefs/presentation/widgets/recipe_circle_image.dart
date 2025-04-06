import 'package:flutter/material.dart';

class RecipeCircleImage extends StatelessWidget {
  const RecipeCircleImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.radius=50,
  });

  final String image;
  final double width, height, radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        image,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
