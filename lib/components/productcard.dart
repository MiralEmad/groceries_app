import 'package:flutter/material.dart';

/// Reusable product card for grocery-style listing screens.
///
/// Drop this into any grid/listing screen:
/// ProductCard(
///   image: 'https://...',
///   name: 'Organic Bananas',
///   subtitle: '7pcs, Priceg',
///   price: 4.99,
///   onQuantityChanged: (qty) => print('$qty in cart'),
/// )
class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final String subtitle;
  final double price;
  final int initialQty;
  final ValueChanged<int>? onQuantityChanged;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.subtitle,
    required this.price,
    this.initialQty = 0,
    this.onQuantityChanged,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late int _qty;

  static const Color _accent = Color(0xFF059669); // emerald-600

  @override
  void initState() {
    super.initState();
    _qty = widget.initialQty;
  }

  void _changeQty(int delta) {
    setState(() {
      _qty = (_qty + delta).clamp(0, 999);
    });
    widget.onQuantityChanged?.call(_qty);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 128,
              width: double.infinity,
              color: const Color(0xFFF9FAFB),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported_outlined,
                        color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Name + subtitle
          Text(
            widget.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            widget.subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF9CA3AF),
            ),
          ),
          const SizedBox(height: 12),

          // Price + add/quantity control
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
              _qty == 0 ? _buildAddButton() : _buildStepper(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return InkWell(
      onTap: () => _changeQty(1),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 36,
        width: 36,
        decoration: const BoxDecoration(
          color: _accent,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _buildStepper() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: _accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _stepperButton(Icons.remove, () => _changeQty(-1)),
          SizedBox(
            width: 20,
            child: Text(
              '$_qty',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          _stepperButton(Icons.add, () => _changeQty(1)),
        ],
      ),
    );
  }

  Widget _stepperButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 28,
        width: 28,
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.white, size: 14),
      ),
    );
  }
}