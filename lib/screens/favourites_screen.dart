
import 'package:flutter/material.dart';
import '../models/favorite_item.dart';
import '../widgets/order_failed_dialog.dart';

class FavoritesScreen extends StatefulWidget {
  /// Called when the "Cart" tab in the bottom bar is tapped.
  /// Optional so this screen still works standalone.
  final VoidCallback? onGoToCart;

  const FavoritesScreen({super.key, this.onGoToCart});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  static const green = Color(0xFF53B175);

  final List<FavoriteItem> _items = const [
    FavoriteItem(
      id: '1',
      name: 'Sprite Can',
      subtitle: '325ml, Price',
      price: 1.50,
      image: 'assets/sprite.png',
    ),
    FavoriteItem(
      id: '2',
      name: 'Diet Coke',
      subtitle: '355ml, Price',
      price: 1.99,
      image: 'assets/diet_cola.png',
    ),
    FavoriteItem(
      id: '3',
      name: 'Apple & Grape Juice',
      subtitle: '2L, Price',
      price: 15.50,
      image: 'assets/apple_juice.png',
    ),
    FavoriteItem(
      id: '4',
      name: 'Coca Cola Can',
      subtitle: '325ml, Price',
      price: 4.99,
      image: 'assets/cola.png',
    ),
    FavoriteItem(
      id: '5',
      name: 'Pepsi Can',
      subtitle: '330ml, Price',
      price: 4.99,
      image: 'assets/pepsi.png',
    ),
  ];

  bool _adding = false;

  Future<void> _handleAddAllToCart() async {
    setState(() => _adding = true);

    // Simulated network call — swap this for your real "add all to cart" request.
    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;
    setState(() => _adding = false);

    // For this prototype we always surface the failure state so it's easy
    // to see and demo. Replace `true` with your real success/failure check.
    const bool requestFailed = true;

    if (requestFailed) {
      showOrderFailedDialog(
        context,
        onRetry: _handleAddAllToCart,
        onBackToHome: () => Navigator.of(context).maybePop(),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All favorites added to cart')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Favourite',
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
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                itemCount: _items.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) =>
                    _favoriteTile(_items[index]),
              ),
            ),
            _addAllButton(),
            _bottomNavBar(),
          ],
        ),
      ),
    );
  }

  Widget _favoriteTile(FavoriteItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              item.image,
              width: 42,
              height: 42,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                  size: 26,
                );
              },
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${item.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.chevron_right,
            size: 20,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  Widget _addAllButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: green,
            disabledBackgroundColor: green.withOpacity(0.6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: _adding ? null : _handleAddAllToCart,
          child: _adding
              ? const SizedBox(
                  width: 22,
                  height: 26,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Add All To Cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    final items = const [
      (Icons.storefront_outlined, 'Shop'),
      (Icons.explore_outlined, 'Explore'),
      (Icons.shopping_cart_outlined, 'Cart'),
      (Icons.favorite, 'Favourite'),
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
            GestureDetector(
              onTap: entry.$2 == 'Cart' ? widget.onGoToCart : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    entry.$1,
                    color: entry.$2 == 'Favourite'
                        ? green
                        : Colors.grey.shade400,
                    size: 22,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entry.$2,
                    style: TextStyle(
                      fontSize: 11,
                      color: entry.$2 == 'Favourite'
                          ? green
                          : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}



