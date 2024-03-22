import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardStyle extends StatelessWidget {
  const CardStyle({
    super.key,
    required this.svgImage,
    required this.text,
    required this.color,
  });

  final String svgImage;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(svgImage),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'NunitoSansSemiBold',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
