import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_figma/config/color/color.dart';
import 'package:neobis_flutter_figma/presentation/widgets/app_bar_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/card_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/search_bar_style.dart';
import 'package:neobis_flutter_figma/presentation/widgets/icon_button_style.dart';
import 'package:neobis_flutter_figma/presentation/widgets/second_row_text.dart';

class ProductSelect extends StatefulWidget {
  const ProductSelect({super.key});

  @override
  State<ProductSelect> createState() => _ProductSelectState();
}

class _ProductSelectState extends State<ProductSelect> {
  int _selectedChipIndex = 0;
  final List<bool?> _isCheckedList = List.generate(10, (_) => false);
  final List<String> _chipList = ["Моя точка", "Проход 12г", "Контейнер 454"];
  final List<String> _imagePaths = [
    'assets/shirt.jpg',
    'assets/hoodie_first.jpg',
    'assets/hoodie_second.jpg',
    'assets/shirt.jpg',
    'assets/hoodie_first.jpg',
    'assets/hoodie_second.jpg',
    'assets/shirt.jpg',
    'assets/hoodie_first.jpg',
    'assets/hoodie_second.jpg',
    'assets/shirt.jpg'
  ];

  void _onChipSelected(int index) {
    setState(() {
      _selectedChipIndex = index;
    });
  }

  void _chooseCheckbox(bool? value, int index) {
    setState(() {
      _isCheckedList[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
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
                  child: IconButtonStyle(
                    icon: 'assets/settings.svg',
                  ),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _isCheckedList[index] ?? false
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 12, left: 12),
                                child: CardText(
                                  text: '№54391',
                                  font: 'NunitoSansBold',
                                  size: 16,
                                ),
                              ),
                              const Spacer(),
                              Checkbox(
                                side: const BorderSide(color: Colors.grey),
                                activeColor: ColorSelect.addCard,
                                value: _isCheckedList[index],
                                onChanged: (bool? value) {
                                  _chooseCheckbox(value, index);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 12, left: 12),
                                child: Image.asset(_imagePaths[index]),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 12, left: 12),
                                      child: CardText(
                                        text:
                                            'Off-white, Футболка из рельефной\nткани',
                                        font: 'NunitoSansSemiBold',
                                        size: 14,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(top: 6, left: 6),
                                          child: SecondRowText(
                                            fontSize: 16,
                                            svgImage: 'assets/green_dot.svg',
                                            text: '500 ₽',
                                            padding: EdgeInsets.only(
                                                left: 12, bottom: 6, right: 4),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 6, left: 6),
                                          child: SecondRowText(
                                            fontSize: 16,
                                            svgImage: 'assets/green_dot.svg',
                                            color: ColorSelect.dotColor,
                                            text: '1 200 ₽',
                                            padding: const EdgeInsets.only(
                                                left: 12, bottom: 6, right: 4),
                                          ),
                                        ),
                                        const Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6, right: 12),
                                            child: CardText(
                                              text: '54шт',
                                              size: 16,
                                              font: 'NunitoSansBold',
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: SecondRowText(
                                            fontSize: 14,
                                            svgImage: 'assets/cube.svg',
                                            text: 'Склад',
                                            padding: EdgeInsets.only(
                                                left: 12, right: 4),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.all(12),
                                          child: CardText(
                                            text: '120 шт',
                                            font: 'NunitoSansSemiBold',
                                            size: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
