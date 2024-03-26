import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_figma/config/constants/color.dart';

class IconButtonStyle extends StatelessWidget {
  const IconButtonStyle({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(ColorSelect.searchBarColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () {},
      icon: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
