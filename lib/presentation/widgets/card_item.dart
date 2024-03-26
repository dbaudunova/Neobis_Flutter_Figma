import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/config/constants/color.dart';
import 'package:neobis_flutter_figma/domain/model/product.dart';
import 'package:neobis_flutter_figma/presentation/widgets/card_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/second_row_text.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.product,
    required this.color,
    required this.checkValue
    , required this.onChanged,
  });

  final Products product;
  final Color color;
  final bool checkValue;
  final void Function(bool? value) onChanged;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {

  void onChange(bool? value) {
    setState(() {
      widget.product.selected = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: widget.color
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12),
                child: CardText(
                  text: widget.product.number,
                  font: 'NunitoSansBold',
                  size: 16,
                ),
              ),
              const Spacer(),
              Checkbox(
                side: const BorderSide(color: Colors.grey),
                activeColor: ColorSelect.addCard,
                value: widget.product.selected,
                onChanged:  widget.onChanged,
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
                child: Image.asset(widget.product.image),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 12),
                      child: CardText(
                        text: widget.product.name,
                        font: 'NunitoSansSemiBold',
                        size: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6, left: 6),
                          child: SecondRowText(
                            fontSize: 16,
                            svgImage: 'assets/green_dot.svg',
                            text: '${widget.product.buyCost} ₽',
                            padding: const EdgeInsets.only(
                                left: 12, bottom: 6, right: 4),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, left: 6),
                          child: SecondRowText(
                            fontSize: 16,
                            svgImage: 'assets/green_dot.svg',
                            color: ColorSelect.dotColor,
                            text: '${widget.product.sellCost} ₽',
                            padding: const EdgeInsets.only(
                                left: 12, bottom: 6, right: 4),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6, right: 12),
                            child: CardText(
                              text: '${widget.product.count}шт',
                              size: 16,
                              font: 'NunitoSansBold',
                              textAlign: TextAlign.end,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: SecondRowText(
                            fontSize: 14,
                            svgImage: 'assets/cube.svg',
                            text: 'Склад',
                            padding: EdgeInsets.only(left: 12, right: 4),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: CardText(
                            text: '${widget.product.stackCount} шт',
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
  }
}
