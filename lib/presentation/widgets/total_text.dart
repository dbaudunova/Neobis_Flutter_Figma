import 'package:flutter/material.dart';

class TotalText extends StatelessWidget {
  const TotalText({
    super.key,
    required this.text,
    required this.font,
    required this.color,
  });

  final String text;
  final String font;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: font,
        fontSize: 16,
        color: color,
      ),
    );
  }
}
