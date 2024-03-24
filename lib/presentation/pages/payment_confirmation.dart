import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/presentation/widgets/app_bar_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/elevated_button_style.dart';
import 'package:neobis_flutter_figma/presentation/widgets/search_bar_widget.dart';
import 'package:neobis_flutter_figma/presentation/widgets/total_text.dart';

class PaymentConfirmation extends StatefulWidget {
  const PaymentConfirmation({super.key});

  @override
  State<PaymentConfirmation> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          title: const AppBarText(
            text: 'Подтверждение оплаты',
            font: 'NunitoSansBold',
            size: 18,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SearchBarStyle(hint: 'Фио покупателя'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SearchBarStyle(
                leading: Padding(
                  padding: EdgeInsets.only(left: 16, top: 16, bottom: 12),
                  child: Text(
                    '+996',
                    style: TextStyle(
                      fontFamily: 'NunitoSansRegular',
                      fontSize: 16,
                    ),
                  ),
                ),
                hint: '(000) 000 000',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SearchBarStyle(hint: 'Сумма'),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12, left: 32),
                  child: AppBarText(
                    color: Colors.black,
                    text: 'Продать в долг',
                    font: 'NunitoSansBold',
                    size: 18,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 32),
                  child: CupertinoSwitch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      }),
                ),
              ],
            ),
            const Spacer(),
            const Divider(),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TotalText(
                    text: 'Количество',
                    font: 'NunitoSansSemiBold',
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TotalText(
                    text: '256 шт',
                    font: 'NunitoSansRegular',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TotalText(
                    text: 'Сумма',
                    font: 'NunitoSansSemiBold',
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TotalText(
                    text: '100 400 ₽',
                    font: 'NunitoSansRegular',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TotalText(
                    text: 'Скидка',
                    font: 'NunitoSansSemiBold',
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TotalText(
                    text: '+ Добавить',
                    font: 'NunitoSansBold',
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TotalText(
                    text: 'Итого в оплате',
                    font: 'NunitoSansSemiBold',
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TotalText(
                    text: '100 402 ₽',
                    font: 'NunitoSansRegular',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButtonStyle(
                    onPressed: () {},
                    text: 'Продать',
                    textColor: Colors.white,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}