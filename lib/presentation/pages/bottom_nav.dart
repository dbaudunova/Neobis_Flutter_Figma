import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_figma/presentation/pages/product.dart';
import 'package:neobis_flutter_figma/presentation/pages/shop.dart';
import 'package:neobis_flutter_figma/presentation/pages/home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List<Widget> _children = const [Home(), Product(), Shop()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'NunitoSansSemiBold',
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'NunitoSansSemiBold',
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem('assets/home.svg', 'Главная'),
          buildBottomNavigationBarItem('assets/cart.svg', 'Товары'),
          buildBottomNavigationBarItem('assets/pin.svg', 'Магазин'),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String svgImage, String label) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        svgImage,
        colorFilter: const ColorFilter.mode(
          Colors.black,
          BlendMode.srcIn,
        ),
      ),
      icon: SvgPicture.asset(
        svgImage,
        colorFilter: const ColorFilter.mode(
          Colors.grey,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
