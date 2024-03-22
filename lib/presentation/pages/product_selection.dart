import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/presentation/widgets/app_bar_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/search_bar_style.dart';
import 'package:neobis_flutter_figma/presentation/widgets/icon_button_style.dart';

class ProductSelect extends StatefulWidget {
  const ProductSelect({super.key});

  @override
  State<ProductSelect> createState() => _ProductSelectState();
}

class _ProductSelectState extends State<ProductSelect> {
  int _selectedChipIndex = 0;
  final List<String> _chipList = ["Моя точка", "Проход 12г", "Контейнер 454"];

  void _onChipSelected(int index) {
    setState(() {
      _selectedChipIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          toolbarHeight: 80,
          centerTitle: true,
          title: const AppBarText(
            text: 'Выбрать товары',
            font: 'NunitoSansBold',
            size: 20,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                    child: SearchBarStyle(
                      hint: 'Поиск',
                      leadingIcon: 'assets/search.svg',
                      trailingIcon: 'assets/scan.svg',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 16, 0),
                  child: IconButtonStyle(icon: 'assets/settings.svg',),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              children: List<Widget>.generate(
                3,
                (index) {
                  return ChoiceChip.elevated(
                    elevation: 0,
                    showCheckmark: false,
                    backgroundColor: Colors.white,
                    selectedColor: Colors.black,
                    labelStyle: TextStyle(
                        color: _selectedChipIndex == index
                            ? Colors.white
                            : Colors.grey,
                        fontFamily: 'NunitoSansSemiBold',
                        fontSize: 13),
                    shape: const StadiumBorder(
                      side: BorderSide(style: BorderStyle.none),
                    ),
                    label: Text(_chipList[index]),
                    selected: _selectedChipIndex == index,
                    onSelected: (bool selected) {
                      _onChipSelected(selected ? index : -1);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
