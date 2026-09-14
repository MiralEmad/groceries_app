class FavoriteItem {
  final String id;
  final String name;
  final String subtitle; // e.g. "325ml, Price"
  final double price;
  final String image; // stand-in for product image
  final String bgHex; // background tint behind the emoji, matches the design

  const FavoriteItem({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
    this.bgHex = 'FFF3F4F6',
  });
}