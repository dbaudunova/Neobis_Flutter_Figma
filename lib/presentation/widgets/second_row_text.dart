import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondRowText extends StatelessWidget {
  const SecondRowText({
    super.key,
    required this.fontSize,
    required this.svgImage,
    required this.text,
    required this.padding,
    this.color,
  });

  final double fontSize;
  final String svgImage;
  final String text;
  final EdgeInsetsGeometry padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
              child: Padding(
            padding: padding,
            child: SvgPicture.asset(
              svgImage,
              color: color,
            ),
          )),
          TextSpan(
            text: text,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'NunitoSansRegular',
                fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
