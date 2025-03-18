import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/models/localization_view_model.dart';
import '../widgets/complete_profile_description.dart';
import '../widgets/complete_profile_gender.dart';
import '../widgets/profile_image_picker.dart';
import '../widgets/recipe_bio_field.dart';
import '../widgets/recipe_elevated_button.dart';

class CompleteProfileView extends StatelessWidget {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.beigeColor,
      appBar: AppBar(
        title: Text(
          localization.profileTitle,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              context.read<LocalizationViewModel>().currentLocale = Locale("uz");
            },
            child: Text("uz"),
          ),
          TextButton(
            onPressed: () {
              context.read<LocalizationViewModel>().currentLocale = Locale("en");
            },
            child: Text("en"),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 48),
        children: [
          CompleteProfileDescription(),
          SizedBox(
            height: 44,
          ),
          ProfileImagePicker(),
          SizedBox(height: 5),
          CompleteProfileGender(),
          SizedBox(height: 5),
          RecipeBioField(),
          SizedBox(
            height: 140,
          ),
          RecipeElevatedButton(text: localization.continues, size: Size(207, 45), fontSize: 20, foregroundColor: Colors.white, callback: () {})
        ],
      ),
    );
  }
}
