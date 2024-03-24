import 'package:flutter/material.dart';


class SizeText extends StatelessWidget {
  const SizeText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'NunitoSansBold',
        fontSize: 18,
      ),
    );
  }
}