enum BottomNavItem {
  home,
  product,
  shop;

  String get iconPath => switch(this) {
    BottomNavItem.home => 'assets/home.svg',
    BottomNavItem.product => 'assets/cart.svg',
    BottomNavItem.shop => 'assets/pin.svg'
  };

  String get name => switch(this) {
    BottomNavItem.home => 'Главная',
    BottomNavItem.product => 'Товары',
    BottomNavItem.shop => 'Магазин'
  };
}