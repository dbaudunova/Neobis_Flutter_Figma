import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
    required this.text,
    required this.font,
    required this.size,
    required this.color,
  });

  final String text;
  final String font;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: font,
        fontSize: size,
        color: color,
        height: 1.5,
      ),
    );
  }
}
