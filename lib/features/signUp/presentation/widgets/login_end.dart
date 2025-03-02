import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/l10n/app_localizations.dart';

class LoginEnd extends StatelessWidget {
  const LoginEnd({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Column(children: [
      Text(
        localization.forgotPassword,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
      SizedBox(height: 74),
      Text(
        'or sign up with',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 13,
        ),
      ),
      SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 14,
        children: [
          SvgPicture.asset('assets/icons/instagram.svg'),
          SvgPicture.asset('assets/icons/google.svg'),
          SvgPicture.asset('assets/icons/facebook.svg'),
          SvgPicture.asset('assets/icons/whatsapp.svg'),
        ],
      ),
      SizedBox(height: 39),
      Text(
        'Don’t have an account? Sign Up',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
      )
    ]);
  }
}