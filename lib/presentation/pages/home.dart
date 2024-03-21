import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_figma/config/color/color.dart';

import '../widgets/app_bar_text.dart';
import '../widgets/card_style.dart';
import '../widgets/category_card.dart';
import '../widgets/info_card_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedChipIndex = 0;
  final List<String> _chipList = ["Сегодня", "7 дней", "Месяц"];

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
          toolbarHeight: 80,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const AppBarText(
                text: 'Торговая точка',
                font: 'NunitoSansRegular',
                size: 15,
                color: Colors.grey,
              ),
              Row(
                children: [
                  const AppBarText(
                    text: 'Проход 456а',
                    font: 'NunitoSansBold',
                    size: 20,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SvgPicture.asset(
                      'assets/arrow_right.svg',
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/bell.svg',
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Wrap(
                    direction: Axis.horizontal,
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
                                  : Colors.black,
                              fontFamily: 'NunitoSansSemiBold',
                              fontSize: 12),
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
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Text(
                    'Календарь',
                    style: TextStyle(
                      fontFamily: 'NunitoSansSemiBold',
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryCard(
                    title: 'Касса',
                    subtitle: '42 310 ₽',
                    svgImage: 'assets/bank_note.svg',
                    color: ColorSelect.cashCardColor,
                    textColor: Colors.black,
                  ),
                  CategoryCard(
                    title: 'Продано',
                    subtitle: '120',
                    svgImage: 'assets/shopping_bag.svg',
                    color: ColorSelect.salesCardColor,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryCard(
                    title: 'Прибыль',
                    subtitle: '+ 32 000',
                    svgImage: 'assets/coins.svg',
                    color: ColorSelect.incomeCardColor,
                    textColor: Colors.green,
                  ),
                  CategoryCard(
                    title: 'Расходы',
                    subtitle: '-2400',
                    svgImage: 'assets/receipt.svg',
                    color: ColorSelect.expenseCardColor,
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Card(
                elevation: 0,
                color: ColorSelect.infoCardColor,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCardItem(
                        text: 'История\nпродаж',
                        svgImage: 'assets/calendar.svg',
                      ),
                      InfoCardItem(
                        text: 'Список\nдолжников',
                        svgImage: 'assets/users.svg',
                      ),
                      InfoCardItem(
                        text: 'Мои\nрасходы',
                        svgImage: 'assets/file.svg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardStyle(
                    svgImage: 'assets/plus.svg',
                    text: 'Добавить',
                    color: ColorSelect.addCard,
                  ),
                  const CardStyle(
                    svgImage: 'assets/plus_cube.svg',
                    text: 'Продать',
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
