import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/config/color/color.dart';
import 'package:neobis_flutter_figma/presentation/widgets/card_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/second_row_text.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  final List<bool?> _isCheckedList = List.generate(10, (_) => false);
  final List<String> _imagePaths = [
    'assets/shirt.jpg',
    'assets/hoodie_first.jpg',
    'assets/hoodie_second.jpg',
    'assets/clothes.jpg',
  ];

  void _chooseCheckbox(bool? value, int index) {
    setState(() {
      _isCheckedList[index] = value;
      if (_isCheckedList[index] ?? false) {
        _showBottomSheet();
      }
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.vertical(top: Radius.zero),
        ),
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ColorSelect.buttonColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: widget.onPressed,
                      child: const Text(
                        'Выбрать',
                        style: TextStyle(
                          fontFamily: 'NunitoSansSemiBold',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
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
                      padding: const EdgeInsets.only(bottom: 12, left: 12),
                      child: Image.asset(_imagePaths[index]),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 12, left: 12),
                            child: CardText(
                              text: 'Off-white, Футболка из рельефной\nткани',
                              font: 'NunitoSansSemiBold',
                              size: 14,
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 6, left: 6),
                                child: SecondRowText(
                                  fontSize: 16,
                                  svgImage: 'assets/green_dot.svg',
                                  text: '500 ₽',
                                  padding: EdgeInsets.only(
                                      left: 12, bottom: 6, right: 4),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6, left: 6),
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
                                  padding: EdgeInsets.only(top: 6, right: 12),
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
                                  padding: EdgeInsets.only(left: 12, right: 4),
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
        });
  }
}
