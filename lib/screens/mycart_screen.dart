import 'package:flutter/material.dart';
import '../components/actionbutton.dart';

/// My Cart Screen
/// List of items added to the basket, each with quantity controls,
/// and a "Checkout" button at the bottom.
class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _CartItem {
  final String name;
  final String subtitle;
  final double price;
  final Color color;
  final IconData icon;
  int quantity;

  _CartItem({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.color,
    required this.icon,
    this.quantity = 1,
  });
}

class _MyCartScreenState extends State<MyCartScreen> {
  final List<_CartItem> _items = [
    _CartItem(
      name: 'Bell Pepper Red',
      subtitle: '1kg, Price',
      price: 4.99,
      color: const Color(0xFFF7D9D9),
      icon: Icons.local_florist,
      quantity: 1,
    ),
    _CartItem(
      name: 'Egg Chicken Red',
      subtitle: '4pcs, Price',
      price: 1.99,
      color: const Color(0xFFFCE9D6),
      icon: Icons.egg,
      quantity: 1,
    ),
    _CartItem(
      name: 'Organic Bananas',
      subtitle: '7pcs, Price',
      price: 4.99,
      color: const Color(0xFFFCEFD0),
      icon: Icons.emoji_food_beverage,
      quantity: 1,
    ),
  ];

  double get _subtotal =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

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
                separatorBuilder: (_, __) => const Divider(height: 24),
                itemBuilder: (context, index) => _buildCartItem(_items[index]),
              ),
            ),
            _buildSummary(),
            const SizedBox(height: 12),
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
            'My Cart',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildCartItem(_CartItem item) {
    return Row(
      children: [
        Container(
          height: 64,
          width: 64,
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
              const SizedBox(height: 6),
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: [
            _stepperButton(Icons.remove, () {
              setState(() {
                if (item.quantity > 1) item.quantity--;
              });
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('${item.quantity}'),
            ),
            _stepperButton(Icons.add, () {
              setState(() => item.quantity++);
            }),
          ],
        ),
      ],
    );
  }

  Widget _stepperButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Color(0xFFF3F3F3),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 14),
      ),
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _summaryRow('Subtotal', '\$${_subtotal.toStringAsFixed(2)}'),
          _summaryRow('Delivery', '\$2.00'),
          const Divider(height: 24),
          _summaryRow(
            'Total',
            '\$${(_subtotal + 2).toStringAsFixed(2)}',
            bold: true,
          ),
          const SizedBox(height: 16),
          PrimaryActionButton(
          label: 'Checkout',
          onPressed: () {
          Navigator.pushNamed(context, '/checkout');
          },
         ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool bold = false}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: bold ? 16 : 14,
      color: bold ? Colors.black : Colors.grey.shade700,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}

