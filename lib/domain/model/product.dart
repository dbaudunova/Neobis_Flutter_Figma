class Products {
  final String name;
  final String number;
  final String image;
  final double sellCost;
  final double buyCost;
  final int count;
  final int stackCount;
   bool selected;

  Products(
      {required this.name,
      required this.number,
      required this.image,
      required this.sellCost,
      required this.buyCost,
      required this.count,
      required this.stackCount,
      this.selected = false});
}
