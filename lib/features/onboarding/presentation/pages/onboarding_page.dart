import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import '../manager/onboarding_view_model.dart';
import '../widgets/button_positioned.dart';
import '../widgets/onboarding_appbar.dart';
import '../widgets/onboarding_image_and_gradient.dart';
import '../widgets/top_shadow.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.ovm});

  final OnBoardingViewModel ovm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ovm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.beigeColor,
        appBar: OnboardingAppBar(
          currentIndex: ovm.currentIndex,
        ),
        body: PageView.builder(
          controller: ovm.controller,
          itemCount: ovm.pages.length + 1,
          onPageChanged: (index) {
            ovm.updateIndex(index);
          },
          itemBuilder: (context, index) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              OnboardingImageAndGradient(ovm: ovm, index: index),
              BottomShadow(),
              ButtonPositioned(
                ovm: ovm,
                index: index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
