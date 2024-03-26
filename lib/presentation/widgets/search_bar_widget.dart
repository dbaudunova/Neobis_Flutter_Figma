import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/config/constants/color.dart';


class SearchBarStyle extends StatelessWidget {
  const SearchBarStyle({
    super.key,
    required this.hint,
    this.leading,
  });

  final String hint;
  final Widget? leading;

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
      leading: leading,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      hintText: hint,
    );
  }
}
