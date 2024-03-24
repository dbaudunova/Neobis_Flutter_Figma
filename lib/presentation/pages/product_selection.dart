import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/presentation/pages/specify_amount.dart';
import 'package:neobis_flutter_figma/presentation/widgets/app_bar_text.dart';
import 'package:neobis_flutter_figma/presentation/widgets/choice_chip.dart';
import 'package:neobis_flutter_figma/presentation/widgets/card_item.dart';
import 'package:neobis_flutter_figma/presentation/widgets/search_bar_style.dart';
import 'package:neobis_flutter_figma/presentation/widgets/icon_button_style.dart';

class ProductSelect extends StatefulWidget {
  const ProductSelect({super.key});

  @override
  State<ProductSelect> createState() => _ProductSelectState();
}

class _ProductSelectState extends State<ProductSelect> {
  final List<String> _chipList = ["Моя точка", "Проход 12г", "Контейнер 454"];

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
          toolbarHeight: 56,
          centerTitle: true,
          title: const AppBarText(
            text: 'Выбрать товары',
            font: 'NunitoSansBold',
            size: 18,
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
            ChoiceChipStyle(
              text: _chipList,
              fontSize: 13,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: CardItem(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const SpecifyAmount(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
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
