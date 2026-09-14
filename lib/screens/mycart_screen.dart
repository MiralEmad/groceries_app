
import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/checkout_sheet.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static const green = Color(0xFF53B175);

  final List<CartItem> _items = [
    CartItem(
      id: '1',
      name: 'Bell Pepper Red',
      subtitle: '1kg, Price',
      price: 4.99,
      image: 'assets/red_pepper.png',
    ),
    CartItem(
      id: '2',
      name: 'Egg Chicken Red',
      subtitle: '4pcs, Price',
      price: 1.99,
      image: 'assets/red_egg.png',
    ),
    CartItem(
      id: '3',
      name: 'Organic Bananas',
      subtitle: '1.2kg, Price',
      price: 3.00,
      image: 'assets/banana.jpg',
    ),
    CartItem(
      id: '4',
      name: 'Ginger',
      subtitle: '250gm, Price',
      price: 2.99,
      image: 'assets/ginger.png',
    ),
  ];

  double get _total =>
      _items.fold(0, (sum, item) => sum + item.lineTotal);

  void _incrementQty(CartItem item) =>
      setState(() => item.quantity++);

  void _decrementQty(CartItem item) {
    setState(() {
      if (item.quantity > 1) item.quantity--;
    });
  }

  void _removeItem(CartItem item) =>
      setState(() => _items.remove(item));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _items.isEmpty
                  ? const Center(
                      child: Text('Your cart is empty'),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      itemCount: _items.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1),
                      itemBuilder: (context, index) =>
                          _cartTile(_items[index]),
                    ),
            ),
            _checkoutButton(),
            _bottomNavBar(),
          ],
        ),
      ),
    );
  }

  Widget _cartTile(CartItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              item.image,
              width: 45,
              height: 45,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                  size: 20,
                );
              },
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _removeItem(item),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _qtyButton(
                      icon: Icons.remove,
                      onTap: () => _decrementQty(item),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        '${item.quantity}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    _qtyButton(
                      icon: Icons.add,
                      onTap: () => _incrementQty(item),
                    ),
                    const Spacer(),
                    Text(
                      '\$${item.lineTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _checkoutButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: _items.isEmpty
              ? null
              : () => showCheckoutSheet(
                    context,
                    total: _total,
                  ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Go to Checkout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '\$${_total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    final items = const [
      (Icons.storefront_outlined, 'Shop'),
      (Icons.explore_outlined, 'Explore'),
      (Icons.shopping_cart, 'Cart'),
      (Icons.favorite_border, 'Favourite'),
      (Icons.person_outline, 'Account'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final entry in items)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  entry.$1,
                  color: entry.$2 == 'Cart'
                      ? green
                      : Colors.grey.shade400,
                  size: 22,
                ),
                const SizedBox(height: 4),
                Text(
                  entry.$2,
                  style: TextStyle(
                    fontSize: 11,
                    color: entry.$2 == 'Cart'
                        ? green
                        : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}


