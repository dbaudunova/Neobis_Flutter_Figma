import 'package:flutter/material.dart';

class ChoiceChipStyle extends StatefulWidget {
  const ChoiceChipStyle({
    super.key,
    required this.text,
    required this.fontSize,
    required this.spacing,
  });

  final List<String> text;
  final double fontSize;
  final double spacing;

  @override
  State<ChoiceChipStyle> createState() => _ChoiceChipStyleState();
}

class _ChoiceChipStyleState extends State<ChoiceChipStyle> {
  int _selectedChipIndex = 0;

  void _onChipSelected(int index) {
    setState(() {
      _selectedChipIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
      children: List<Widget>.generate(
        widget.text.length,
            (index) {
          return ChoiceChip.elevated(
            elevation: 0,
            showCheckmark: false,
            backgroundColor: Colors.white,
            selectedColor: Colors.black,
            labelStyle: TextStyle(
                color: _selectedChipIndex == index ? Colors.white : Colors.grey,
                fontFamily: 'NunitoSansSemiBold',
                fontSize: widget.fontSize),
            shape: const StadiumBorder(
              side: BorderSide(style: BorderStyle.none),
            ),
            label: Text(widget.text[index]),
            selected: _selectedChipIndex == index,
            onSelected: (bool selected) {
              _onChipSelected(selected ? index : -1);
            },
          );
        },
      ),
    );
  }
}