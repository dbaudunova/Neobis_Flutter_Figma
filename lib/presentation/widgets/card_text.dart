import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  const CardText({
    super.key,
    required this.text,
    required this.font,
    required this.size,
    this.textAlign,
  });

  final String text;
  final String font;
  final double size;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: font,
        fontSize: size,
      ),
      textAlign: textAlign,
    );
  }
}