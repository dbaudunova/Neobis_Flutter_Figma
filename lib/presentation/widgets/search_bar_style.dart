import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_figma/config/color/color.dart';

class SearchBarStyle extends StatelessWidget {
  const SearchBarStyle({
    super.key,
    required this.hint,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  final String hint;
  final String leadingIcon, trailingIcon;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor:
          MaterialStateProperty.all<Color>(ColorSelect.searchBarColor),
      elevation: MaterialStateProperty.all<double>(0),
      hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
        return const TextStyle(
          color: Colors.grey,
          fontFamily: 'NunitoSansRegular',
          fontSize: 16,
        );
      }),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      hintText: hint,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: SvgPicture.asset(leadingIcon),
      ),
      trailing: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SvgPicture.asset(trailingIcon),
        ),
      ],
    );
  }
}
