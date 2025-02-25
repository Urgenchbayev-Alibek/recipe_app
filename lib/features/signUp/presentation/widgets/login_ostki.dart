import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginOstki extends StatelessWidget {
  const LoginOstki({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Forget password',
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
          SvgPicture.asset('assets/icons/watsapp.svg'),
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