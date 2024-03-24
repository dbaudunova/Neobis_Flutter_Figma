import 'package:flutter/material.dart';

class ElevatedButtonStyle extends StatelessWidget {
  const ElevatedButtonStyle({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  });

  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'NunitoSansSemiBold',
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
