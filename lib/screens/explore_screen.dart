import 'package:flutter/material.dart';

/// Explore Screen
/// "Find Products" search bar followed by a grid of category cards
/// (Fresh Fruits & Vegetable, Cooking Oil & Ghee, Meat & Fish,
/// Bakery & Snacks, Dairy & Eggs, Beverages) and a bottom nav bar.
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static final List<_CategoryData> _categories = [
    _CategoryData('Frash Fruits\n& Vegetable', const Color(0xFFDFF3E3),
        Icons.eco),
    _CategoryData('Cooking Oil\n& Ghee', const Color(0xFFFCE9D6),
        Icons.local_drink),
    _CategoryData('Meat & Fish', const Color(0xFFF7D9D9), Icons.set_meal),
    _CategoryData(
        'Bakery & Snacks', const Color(0xFFE9DDF7), Icons.bakery_dining),
    _CategoryData('Dairy & Eggs', const Color(0xFFFCEFD0), Icons.egg),
    _CategoryData(
        'Beverages', const Color(0xFFD9E8F7), Icons.local_bar),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Find Products',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSearchBar(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  return _CategoryCard(data: _categories[index]);
                },
              ),
            ),
            const _BottomNavBar(currentIndex: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Store',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryData {
  final String name;
  final Color color;
  final IconData icon;

  _CategoryData(this.name, this.color, this.icon);
}

class _CategoryCard extends StatelessWidget {
  final _CategoryData data;

  const _CategoryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: data.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(data.icon, size: 32, color: Colors.black87),
          Text(
            data.name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    );
  }
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

