import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/sizes.dart';
import '../../../../core/utils/colors.dart';

class RecipePasswordFormField extends StatelessWidget {
  const RecipePasswordFormField({super.key, required this.controller, required this.validator});

  final TextEditingController controller;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            localization.password,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SizedBox(
            width: 357 * AppSizes.wRatio,
            child: TextFormField(
              validator: validator,
              controller: controller,
              style: TextStyle(
                height: 1,
                color: AppColors.beigeColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.pink,
                hintText: '●●●●●●●●',
                hintStyle: TextStyle(
                  color: AppColors.beigeColor.withValues(alpha: 0.45),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                  height: 1,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(18),
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.only(right: AppSizes.padding36),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    width: 20,
                    "assets/icons/eye.svg",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
