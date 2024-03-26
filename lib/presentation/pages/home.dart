import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_figma/config/constants/color.dart';
import 'package:neobis_flutter_figma/presentation/pages/product_selection.dart';
import 'package:neobis_flutter_figma/presentation/widgets/app_bar_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/card_style.dart';
import 'package:neobis_flutter_figma/presentation/widgets/category_card.dart';
import 'package:neobis_flutter_figma/presentation/widgets/choice_chip.dart';
import 'package:neobis_flutter_figma/presentation/widgets/info_card_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _chipList = ["Сегодня", "7 дней", "Месяц"];
  static const _arrowIcon = 'assets/arrow_right.svg';
  static const _bellIcon = 'assets/bell.svg';
  static const _bankNoteIcon = 'assets/bank_note.svg';
  static const _shoppingBagIcon = 'assets/shopping_bag.svg';
  static const _coinsIcon = 'assets/coins.svg';
  static const _receiptIcon = 'assets/receipt.svg';
  static const _calendarIcon = 'assets/calendar.svg';
  static const _usersIcon = 'assets/users.svg';
  static const _fileIcon = 'assets/file.svg';
  static const _plusIcon = 'assets/plus.svg';
  static const _plusCubeIcon = 'assets/plus_cube.svg';

  void _navigate(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const ProductSelect(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  Column _getAppBarTitle() {
    return Column(
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
              size: 18,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: SvgPicture.asset(
                _arrowIcon,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: _getAppBarTitle(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                _bellIcon,
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
                child: ChoiceChipStyle(
                  spacing: 6,
                  text: _chipList,
                  fontSize: 12,
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    'Календарь',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'NunitoSansSemiBold',
                      fontSize: 14,
                      color: Colors.blue,
                    ),
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
                  svgImage: _bankNoteIcon,
                  color: ColorSelect.cashCardColor,
                  textColor: Colors.black,
                ),
                CategoryCard(
                  title: 'Продано',
                  subtitle: '120',
                  svgImage: _shoppingBagIcon,
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
                  svgImage: _coinsIcon,
                  color: ColorSelect.incomeCardColor,
                  textColor: Colors.green,
                ),
                CategoryCard(
                  title: 'Расходы',
                  subtitle: '-2400',
                  svgImage: _receiptIcon,
                  color: ColorSelect.expenseCardColor,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            color: ColorSelect.infoCardColor,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCardItem(
                  text: 'История\nпродаж',
                  svgImage: _calendarIcon,
                ),
                InfoCardItem(
                  text: 'Список\nдолжников',
                  svgImage: _usersIcon,
                ),
                InfoCardItem(
                  text: 'Мои\nрасходы',
                  svgImage: _fileIcon,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _navigate(context);
                    },
                    child: CardStyle(
                      svgImage: _plusIcon,
                      text: 'Добавить',
                      color: ColorSelect.addCard,
                    ),
                  ),
                ),
                const Expanded(
                  child: CardStyle(
                    svgImage: _plusCubeIcon,
                    text: 'Продать',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
