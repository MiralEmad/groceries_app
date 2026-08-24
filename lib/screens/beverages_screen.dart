import 'package:flutter/material.dart';
import '../components/productcard.dart';

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  static final List<_ProductData> _products = [
    _ProductData(
      image: 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=300&h=300&fit=crop',
      name: 'Diet Coke',
      subtitle: '355ml, Price',
      price: 1.99,
    ),
    _ProductData(
      image: 'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?w=300&h=300&fit=crop',
      name: 'Sprite Can',
      subtitle: '325ml, Price',
      price: 1.50,
    ),
    _ProductData(
      image: 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=300&h=300&fit=crop',
      name: 'Apple & Grape Juice',
      subtitle: '2L, Price',
      price: 15.99,
    ),
    _ProductData(
      image: 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=300&h=300&fit=crop',
      name: 'Orange Juice',
      subtitle: '2L, Price',
      price: 15.99,
    ),
    _ProductData(
      image: 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=300&h=300&fit=crop',
      name: 'Coca Cola Can',
      subtitle: '325ml, Price',
      price: 4.99,
    ),
    _ProductData(
      image: 'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?w=300&h=300&fit=crop',
      name: 'Pepsi Can',
      subtitle: '330ml, Price',
      price: 4.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final p = _products[index];
                  return ProductCard(
                    image: p.image,
                    name: p.name,
                    subtitle: p.subtitle,
                    price: p.price,
                    onQuantityChanged: (qty) {
                      // TODO: wire into your cart state
                      debugPrint('${p.name}: $qty in cart');
                    },
                  );
                },
              ),
            ),
            const _BottomNavBar(currentIndex: 0),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            onPressed: () => Navigator.maybePop(context),
          ),
          const Text(
            'Beverages',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ProductData {
  final String image;
  final String name;
  final String subtitle;
  final double price;

  _ProductData({
    required this.image,
    required this.name,
    required this.subtitle,
    required this.price,
  });
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const _BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItemData(Icons.storefront, 'Shop'),
      _NavItemData(Icons.explore_outlined, 'Explore'),
      _NavItemData(Icons.shopping_cart_outlined, 'Cart'),
      _NavItemData(Icons.favorite_border, 'Favourite'),
      _NavItemData(Icons.person_outline, 'Account'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final selected = index == currentIndex;
          final color = selected ? Colors.green : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(items[index].icon, color: color, size: 22),
              const SizedBox(height: 2),
              Text(
                items[index].label,
                style: TextStyle(color: color, fontSize: 11),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;

  _NavItemData(this.icon, this.label);
}
