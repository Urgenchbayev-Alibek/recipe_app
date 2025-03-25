import 'package:flutter/material.dart';
@immutable
class RecipeAppText extends StatelessWidget {
  const RecipeAppText({
    super.key,
    required this.data,
    required this.color,
    required this.size,
    this.weight = FontWeight.w400,
     this.line=1 ,
    this.height,
    this.font = true, // Default qiymat true
  });

  final String data;
  final Color color;
  final double size;
  final FontWeight weight;
  final int? line;
  final double? height;
  final bool font;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: font ? 'Poppins' : 'League Spartan',
        fontSize: size,
        color: color,
        height: height,
        fontWeight: weight,
      ),
    );
  }
}
