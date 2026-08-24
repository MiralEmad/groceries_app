import 'package:flutter/material.dart';
import '../components/addbutton.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller =
      TextEditingController(text: 'Egg');

  static final List<_ProductData> _results = [
    _ProductData('Egg Chicken Red', '4pcs, Price', '\$1.99',
        const Color(0xFFFCE9D6), Icons.egg),
    _ProductData('Egg Chicken White', '180g, Price', '\$1.50',
        const Color(0xFFFCEFD0), Icons.egg),
    _ProductData('Egg Pasta', '30gm, Price', '\$15.99',
        const Color(0xFFF7D9D9), Icons.ramen_dining),
    _ProductData('Egg Noodles', '2L, Price', '\$15.99',
        const Color(0xFFF7D9D9), Icons.ramen_dining),
    _ProductData('Mayonnais Eggless', '400g, Price', '\$4.99',
        const Color(0xFFFCEFD0), Icons.icecream),
    _ProductData('Egg Noodles', '250g, Price', '\$4.99',
        const Color(0xFFE9DDF7), Icons.ramen_dining),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: _buildSearchBar(),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return _ProductCard(data: _results[index]);
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
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search Store',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18, color: Colors.grey),
            onPressed: () => setState(() => _controller.clear()),
          ),
          const Icon(Icons.tune, color: Colors.grey),
        ],
      ),
    );
  }
}

class _ProductData {
  final String name;
  final String subtitle;
  final String price;
  final Color color;
  final IconData icon;

  _ProductData(
      this.name, this.subtitle, this.price, this.color, this.icon);
}

class _ProductCard extends StatelessWidget {
  final _ProductData data;

  const _ProductCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: data.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(data.icon, size: 40, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            data.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          Text(
            data.subtitle,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              AddButton(
               size: 36,
               onTap: () {
               print('${data.name} added');
               },
),
            ],
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

