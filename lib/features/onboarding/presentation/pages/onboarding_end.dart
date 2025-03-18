import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../profile/presentation/pages/profile_view_model.dart';
import '../../../../data/models/localization_view_model.dart';
import '../widgets/elevatedbutton_widget.dart';
import '../widgets/onboarding_end_categories_widget.dart';

class OnboardingEnd extends StatelessWidget {
  const OnboardingEnd({super.key, required this.pvm});

  final ProfileViewModel pvm;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return ListenableBuilder(
      listenable: pvm,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(actions: [
            TextButton(
              onPressed: () {
                Provider.of<LocalizationViewModel>(context, listen: false).currentLocale = Locale("uz");
              },
              child: Text("uz"),
            ),
            TextButton(
              onPressed: () {
                Provider.of<LocalizationViewModel>(context, listen: false).currentLocale = Locale("en");
              },
              child: Text("en"),
            ),
          ],),
          body: pvm.myRecipe == null || pvm.myRecipe!.isEmpty
              ? Center(child: const CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 11,
                    children: [
                      OnboardingEndCategoriesWidget(pvm: pvm),
                      Text(
                        localization.welcome,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        maxLines: 3,
                        localization.welcomeDescription,
                        style: TextStyle(fontSize: 13),
                      ),
                      ElevatedButtonWidget(text: localization.imNew, onPressed: () {}),
                      ElevatedButtonWidget(
                          text: localization.iveBeenHere, onPressed: () {}),
                      SizedBox(height: 35),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
