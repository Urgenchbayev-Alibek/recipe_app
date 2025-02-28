import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Positioned(
      bottom: 47,
      child: ElevatedButtonWidget(
        text: 'Continue',
        onPressed: () {
          if (ovm.pages.length - 1 == index) {
            context.go('/onboarding_end');
          }
          ovm.controller.nextPage(
              duration: Duration(microseconds: 300), curve: Curves.linear);
        },
      ),
    );
  }
}
