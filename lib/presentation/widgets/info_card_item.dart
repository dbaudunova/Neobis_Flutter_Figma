import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoCardItem extends StatelessWidget {
  const InfoCardItem({
    super.key,
    required this.text,
    required this.svgImage,
  });

  final String text;
  final String svgImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          svgImage,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'NunitoSansSemiBold',
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}
