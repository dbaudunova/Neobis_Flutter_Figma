import 'package:flutter/material.dart';
import 'package:neobis_flutter_figma/config/constants/color.dart';
import 'package:neobis_flutter_figma/domain/model/product.dart';
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
  static const _searchIcon = 'assets/search.svg';
  static const _scanIcon = 'assets/scan.svg';
  static const _settingsIcon = 'assets/settings.svg';

  final List<bool> _isCheckedList = List.generate(10, (_) => false);

  final _products = [
    Products(
      name: 'Off-white, Футболка из рельефной ткани',
      number: '№54931',
      image: 'assets/shirt.jpg',
      sellCost: 500,
      buyCost: 1200,
      count: 54,
      stackCount: 120,
    ),
    Products(
      name: 'Off-white, Футболка из рельефной ткани',
      number: '№54931',
      image: 'assets/hoodie_first.jpg',
      sellCost: 500,
      buyCost: 1200,
      count: 54,
      stackCount: 120,
    ),
    Products(
      name: 'Off-white, Футболка из рельефной ткани',
      number: '№54931',
      image: 'assets/hoodie_second.jpg',
      sellCost: 500,
      buyCost: 1200,
      count: 54,
      stackCount: 120,
    ),
    Products(
      name: 'Off-white, Футболка из рельефной ткани',
      number: '№54931',
      image: 'assets/clothes.jpg',
      sellCost: 500,
      buyCost: 1200,
      count: 54,
      stackCount: 120,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: [
          Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                      child: SearchBarStyle(
                        hint: 'Поиск',
                        leadingIcon: _searchIcon,
                        trailingIcon: _scanIcon,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 16, 0),
                    child: IconButtonStyle(
                      icon: _settingsIcon,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ChoiceChipStyle(
                spacing: 6,
                text: _chipList,
                fontSize: 13,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: _buildListView(),
                ),
              ),
            ],
          ),
          if (_products.any((element) => element.selected == true))
            _buildPopUp(context),
        ],
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CardItem(
            onChanged: (value) => setState(
              () {
                _products.elementAt(index).selected = value ?? false;
              },
            ),
            product: _products.elementAt(index),
            color: _isCheckedList[index] ? Colors.blue : Colors.transparent,
            checkValue: _isCheckedList[index],
          );
        });
  }

  Align _buildPopUp(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorSelect.buttonColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _navigator(context);
                  },
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
      ),
    );
  }

  void _navigator(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const SpecifyAmount(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
