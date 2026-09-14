class CartItem {
  final String id;
  final String name;
  final String subtitle; // e.g. "1kg, Price"
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  double get lineTotal => price * quantity;
}