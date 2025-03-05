import 'package:flutter/material.dart';
class TopChefItem extends StatelessWidget {
  const TopChefItem({super.key, required this.image, required this.name});

  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          child: Image(
            image: AssetImage(image),
            height: 74,
            width: 83,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            color: Color(0xffFFFDF9),
          ),
        ),
      ],
    );
  }
}