import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/config/constants/color.dart';
import 'package:neobis_flutter_figma/presentation/pages/payment_confirmation.dart';
import 'package:neobis_flutter_figma/presentation/widgets/amount_card.dart';
import 'package:neobis_flutter_figma/presentation/widgets/app_bar_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/card_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/choice_chip.dart';
import 'package:neobis_flutter_figma/presentation/widgets/elevated_button_style.dart';
import 'package:neobis_flutter_figma/presentation/widgets/second_row_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/size_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/total_text.dart';

class SpecifyAmount extends StatefulWidget {
  const SpecifyAmount({super.key});

  @override
  State<SpecifyAmount> createState() => _SpecifyAmountState();
}

class _SpecifyAmountState extends State<SpecifyAmount> {
  final List<String> _chipList = ["Товар 1", "Товар 2", "Товар 3", "Товар 4"];

  void _navigate(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const PaymentConfirmation(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 56,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const AppBarText(
          text: 'Указать количество',
          font: 'NunitoSansBold',
          size: 18,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ChoiceChipStyle(text: _chipList, fontSize: 13, spacing: 10,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12, left: 12),
                        child: Image.asset('assets/shirt.jpg'),
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
                                  padding:
                                      const EdgeInsets.only(top: 6, left: 6),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                        child: SizeText(text: 'XS'),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: AmountCard(),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                        child: SizeText(text: 'S'),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: AmountCard(),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                        child: SizeText(text: 'S'),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: AmountCard(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Divider(),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TotalText(
                  text: 'Итого',
                  font: 'NunitoSansSemiBold',
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: TotalText(
                  text: '100 402 ₽',
                  font: 'NunitoSansRegular',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButtonStyle(
                onPressed: () {
                  _navigate(context);
                },
                text: 'Продолжить',
                textColor: Colors.black,
                backgroundColor: ColorSelect.buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
