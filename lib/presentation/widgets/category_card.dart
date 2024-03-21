import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svgImage,
    required this.color,
    required this.textColor,
  });

  final String title, subtitle;
  final String svgImage;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Card(
          elevation: 0,
          color: color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontFamily: 'NunitoSansRegular',
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 0, 12),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: 'NunitoSansBold',
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      svgImage,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
