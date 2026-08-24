import 'package:flutter/material.dart';
import '../components/addbutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    _buildLocationHeader(),

                    const SizedBox(height: 16),

                    _buildSearchBar(),

                    const SizedBox(height: 16),

                    _buildPromoBanner(),

                    const SizedBox(height: 24),

                    // Exclusive Offer
                    _buildSectionHeader('Exclusive Offer'),

                    const SizedBox(height: 12),

                    _buildProductRow([
                      _ProductData(
                        name: 'Organic Bananas',
                        subtitle: '7pcs, Price',
                        price: '\$4.99',
                        color: const Color(0xFFFFF3D6),
                        image: 'assets/banana.jpg',
                      ),
                      _ProductData(
                        name: 'Red Apple',
                        subtitle: '1kg, Price',
                        price: '\$4.99',
                        color: const Color(0xFFFFE0E0),
                        image: 'assets/redapples.jpg',
                      ),
                      _ProductData(
                        name: 'Green Apple',
                        subtitle: '1kg, Price',
                        price: '\$4.99',
                        color: const Color(0xFFE0F5E0),
                        image: 'assets/greenapples.jpg',
                      ),
                    ]),

                    const SizedBox(height: 24),

                    // Best Selling
                    _buildSectionHeader('Best Selling'),

                    const SizedBox(height: 12),

                    _buildProductRow([
                      _ProductData(
                        name: 'Strawberry',
                        subtitle: '1kg, Price',
                        price: '\$4.99',
                        color: const Color(0xFFFFE0E0),
                        image: 'assets/strawberry.jpg',
                      ),
                      _ProductData(
                        name: 'Fresh Herbs',
                        subtitle: '1kg, Price',
                        price: '\$4.99',
                        color: const Color(0xFFE0F5E0),
                        image: 'assets/herbs.jpg',
                      ),
                      _ProductData(
                        name: 'Fresh Vegetables',
                        subtitle: '1kg, Price',
                        price: '\$4.99',
                        color: const Color(0xFFE0F5E0),
                        image: 'assets/vegetables.jpg',
                      ),
                    ]),

                    const SizedBox(height: 24),

                    // Groceries
                    _buildSectionHeader('Groceries'),

                    const SizedBox(height: 12),

                    _buildCategoryRow(),

                    const SizedBox(height: 16),

                    _buildProductRow([
                      _ProductData(
                        name: 'Beef Bone',
                        subtitle: '1kg, Price',
                        price: '\$4.99',
                        color: const Color(0xFFFFE0E0),
                        image: 'assets/beef.jpg',
                      ),
                      _ProductData(
                        name: 'Broiler Chicken',
                        subtitle: '1kg, Price',
                        price: '\$4.99',
                        color: const Color(0xFFFFF3D6),
                        image: 'assets/chicken.jpg',
                      ),
                      _ProductData(
                        name: 'Chicken Breast',
                        subtitle: '1kg, Price',
                        price: '\$5.99',
                        color: const Color(0xFFFFE0E0),
                        image: 'assets/chicken2.jpg',
                      ),
                    ]),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            const _BottomNavBar(currentIndex: 0),
          ],
        ),
      ),
    );
  }

  // Location
  Widget _buildLocationHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/carrot.png',
          width: 414,
          height: 98.26,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.location_on,
              color: Colors.green,
              size: 18,
            ),
            SizedBox(width: 4),
            Text(
              'Dhaka, Banassre',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Search
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Store',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Promo Banner
  Widget _buildPromoBanner() {
    return Container(
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8E8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Fresh Vegetables',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Get Up To 40% Off',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Section Header
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'See all',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Horizontal Product Scroll
  Widget _buildProductRow(List<_ProductData> products) {
    return SizedBox(
      height: 215,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == products.length - 1 ? 0 : 12,
            ),
            child: SizedBox(
              width: 170,
              child: _ProductCard(
                data: products[index],
              ),
            ),
          );
        },
      ),
    );
  }

  // Categories
  Widget _buildCategoryRow() {
    final categories = [
      _CategoryData(
        'Pulses',
        const Color(0xFFFCE9D6),
        Icons.grain,
      ),
      _CategoryData(
        'Rice',
        const Color(0xFFE0F5E0),
        Icons.rice_bowl,
      ),
    ];

    return Row(
      children: categories.map(
        (c) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: c.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      c.icon,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      c.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

// Product Data
class _ProductData {
  final String name;
  final String subtitle;
  final String price;
  final Color color;
  final String image;

  _ProductData({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.color,
    required this.image,
  });
}

// Category Data
class _CategoryData {
  final String name;
  final Color color;
  final IconData icon;

  _CategoryData(
    this.name,
    this.color,
    this.icon,
  );
}

// Product Card
class _ProductCard extends StatelessWidget {
  final _ProductData data;

  const _ProductCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 70,
              width: double.infinity,
              color: data.color,
              child: Image.asset(
                data.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            data.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),

          Text(
            data.subtitle,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 11,
            ),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              AddButton(
                onTap: () {
                  print('added to cart');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Bottom Navigation
class _BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const _BottomNavBar({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItemData(
        Icons.storefront,
        'Shop',
      ),
      _NavItemData(
        Icons.explore_outlined,
        'Explore',
      ),
      _NavItemData(
        Icons.shopping_cart_outlined,
        'Cart',
      ),
      _NavItemData(
        Icons.favorite_border,
        'Favourite',
      ),
      _NavItemData(
        Icons.person_outline,
        'Account',
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            final selected =
                index == currentIndex;

            final color =
                selected
                    ? Colors.green
                    : Colors.grey;

            return Column(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Icon(
                  items[index].icon,
                  color: color,
                  size: 22,
                ),
                const SizedBox(height: 2),
                Text(
                  items[index].label,
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Navigation Item Data
class _NavItemData {
  final IconData icon;
  final String label;

  _NavItemData(
    this.icon,
    this.label,
  );
}