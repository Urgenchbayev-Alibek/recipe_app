import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowingButton extends StatelessWidget {
  const FollowingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      height: 21,
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Following',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }
}
