import 'package:flutter/material.dart';

import '../pages/profile_view_model.dart';

class ProfileAppBarLeading extends StatelessWidget {
  const ProfileAppBarLeading({
    super.key,
    required this.vm,
  });

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(51),
      child: Image.network(
        vm.myProfile!.image,
      ),
    );
  }
}
