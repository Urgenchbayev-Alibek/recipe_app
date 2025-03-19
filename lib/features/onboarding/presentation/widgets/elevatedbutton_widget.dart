import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
          AppColors.pinkSub,
        ),
        backgroundColor: WidgetStateProperty.all(
          AppColors.pink,
        ),
        fixedSize: WidgetStateProperty.all(const Size(207, 45)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
