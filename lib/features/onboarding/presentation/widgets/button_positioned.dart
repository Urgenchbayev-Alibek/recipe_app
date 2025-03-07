import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../manager/onboarding_view_model.dart';
import 'elevatedbutton_widget.dart';

class ButtonPositioned extends StatelessWidget {
  const ButtonPositioned({
    super.key,
    required this.ovm,
    required this.index,
  });

  final OnBoardingViewModel ovm;

  final int index;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Positioned(
      bottom: 47,
      child: ElevatedButtonWidget(
        text: 'Continue',
        onPressed: () {
          if (ovm.pages.length - 1 == index) {
            context.go(Routes.onboardingEnd);
          }
          ovm.controller.nextPage(
              duration: Duration(microseconds: 300), curve: Curves.linear);
        },
      ),
    );
  }
}
