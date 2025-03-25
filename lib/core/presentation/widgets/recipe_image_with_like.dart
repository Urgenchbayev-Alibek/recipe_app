import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_app_button_container.dart';


import '../../../../Core/utils/colors.dart';

class RecipeImageWithLike<T> extends StatefulWidget {
  RecipeImageWithLike({
    super.key,
    required this.recipe,
    required this.getPhotoUrl,
    this.width,
    this.height,
    this.onPress = false,
    this.shadow = true, // Default qiymat shadow=true bo‘ldi
  });

  final double? width, height;
  final bool shadow; // Nullable emas, default qiymatga ega
  final T recipe;
  bool onPress;
  final String Function(T) getPhotoUrl;

  @override
  State<RecipeImageWithLike<T>> createState() => _RecipeImageWithLikeState<T>();
}

class _RecipeImageWithLikeState<T> extends State<RecipeImageWithLike<T>> {
  @override
  Widget build(BuildContext context) {
    double finalWidth = widget.width ?? 169.w;
    double finalHeight = widget.height ?? 153.h;

    return SizedBox(
      width: finalWidth,
      height: finalHeight,
      child: Stack(
        children: [
          Container(
            width: finalWidth,
            height: finalHeight,
            decoration: BoxDecoration(
              boxShadow: widget.shadow
                  ? [
                      BoxShadow(
                        color: AppColors.beigeColor,
                        offset: const Offset(0, 1),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ]
                  : [], // Agar shadow false bo‘lsa, bo‘sh list
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageUrl: widget.getPhotoUrl(widget.recipe),
                width: finalWidth,
                height: finalHeight,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            top: 7,
            right: 8,
            child: RecipeAppButtonContainer(widget: widget),
          ),
        ],
      ),
    );
  }
}
