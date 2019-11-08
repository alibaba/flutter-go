class ProductItem {
  final String name;
  final String tag;
  final String asset;
  final int stock;
  final double price;

  ProductItem({
    this.name,
    this.tag,
    this.asset,
    this.stock,
    this.price,
  });
}

final List<ProductItem> products = [
  ProductItem(
      name: 'Bueno Chocolate',
      tag: '1',
      asset: 'assets/images/food01.jpeg',
      stock: 1,
      price: 71.0),
  ProductItem(
      name: 'Chocolate with berries',
      tag: '2',
      asset: 'assets/images/food02.jpeg',
      stock: 1,
      price: 71.0),
  ProductItem(
      name: 'Trumoo Candies',
      tag: '3',
      asset: 'assets/images/food03.jpeg',
      stock: 1,
      price: 71.0),
  ProductItem(
      name: 'Choco-coko',
      tag: '4',
      asset: 'assets/images/food04.jpeg',
      stock: 1,
      price: 71.0),
  ProductItem(
      name: 'Chocolate tree',
      tag: '5',
      asset: 'assets/images/food05.jpeg',
      stock: 1,
      price: 71.0),
  ProductItem(
      name: 'Chocolate',
      tag: '6',
      asset: 'assets/images/food06.jpeg',
      stock: 1,
      price: 71.0),
];
