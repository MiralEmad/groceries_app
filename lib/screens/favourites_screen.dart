import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static final List<_FavItem> _items = [
    _FavItem('Sprite Can', '325ml, Price', '\$1.50',
        const Color(0xFFE0F5E0), Icons.local_drink),
    _FavItem('Bell Pepper Red', '1kg, Price', '\$4.99',
        const Color(0xFFF7D9D9), Icons.local_florist),
    _FavItem('Ginger', '250gm, Price', '\$2.99',
        const Color(0xFFFCEFD0), Icons.grass),
    _FavItem('Apple & Grape Juice', '2L, Price', '\$15.99',
        const Color(0xFFFCE9D6), Icons.local_bar),
    _FavItem('Coca Cola Can', '325ml, Price', '\$4.99',
        const Color(0xFFF7D9D9), Icons.local_drink),
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
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _items.length,
                separatorBuilder: (_, __) => const Divider(height: 20),
                itemBuilder: (context, index) =>
                    _buildFavRow(_items[index]),
              ),
            ),
            const _BottomNavBar(currentIndex: 3),
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
            'Favorites',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildFavRow(_FavItem item) {
    return Row(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(item.icon, color: Colors.black54),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                item.subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                item.price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 18),
        ),
      ],
    );
  }
}

class _FavItem {
  final String name;
  final String subtitle;
  final String price;
  final Color color;
  final IconData icon;

  _FavItem(this.name, this.subtitle, this.price, this.color, this.icon);
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

