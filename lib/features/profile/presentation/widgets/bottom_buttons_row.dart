import 'package:flutter/material.dart';
import 'package:recipe_app/features/profile/presentation/widgets/profile_elevated_button.dart';
class BottomButtonsRow extends StatelessWidget {
  const BottomButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileElevatedButton(text: 'Edit Profile'),
        ProfileElevatedButton(text: 'Share Profile'),
      ],
    );
  }
}
