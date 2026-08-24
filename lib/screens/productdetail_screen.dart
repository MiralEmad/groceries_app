import 'package:flutter/material.dart';
import '../components/actionbutton.dart';
/// Product Detail Screen
/// Shows a large product image, name, price, quantity stepper,
/// expandable product detail / nutrition / review sections and
/// an "Add To Basket" button.
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isFavourite = false;

  void _increment() => setState(() => _quantity++);

  void _decrement() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductImage(),
                    const SizedBox(height: 16),
                    _buildTitleRow(),
                    const SizedBox(height: 4),
                    Text(
                      '1kg, Price',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 16),
                    _buildQuantityAndPrice(),
                    const Divider(height: 32),
                    _buildExpandableSection(
                      title: 'Product Detail',
                      initiallyExpanded: true,
                      content:
                          'Apples Are Nutritious. Apples May Be Good For '
                          'Weight Loss. Apples May Be Good For Your Heart. '
                          'As Part Of A Healthful And Varied Diet.',
                    ),
                    const Divider(height: 32),
                    _buildSimpleExpandRow('Nutritions', trailing: '100gr'),
                    const Divider(height: 32),
                    _buildReviewRow(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildAddToBasketButton(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
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
            'Product Detail',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(Icons.apple, size: 100, color: Colors.redAccent),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Text(
            'Naturel Red Apple',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: Icon(
            _isFavourite ? Icons.favorite : Icons.favorite_border,
            color: _isFavourite ? Colors.red : Colors.black54,
          ),
          onPressed: () => setState(() => _isFavourite = !_isFavourite),
        ),
      ],
    );
  }

  Widget _buildQuantityAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _stepperButton(Icons.remove, _decrement),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '$_quantity',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _stepperButton(Icons.add, _increment),
          ],
        ),
        Text(
          '\$${(4.99 * _quantity).toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _stepperButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required String content,
    bool initiallyExpanded = false,
  }) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        initiallyExpanded: initiallyExpanded,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              content,
              style: TextStyle(color: Colors.grey.shade600, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleExpandRow(String title, {required String trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Row(
          children: [
            Text(trailing, style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildReviewRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Review',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Row(
          children: [
            ...List.generate(
              5,
              (i) => const Icon(Icons.star, color: Colors.amber, size: 18),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildAddToBasketButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: PrimaryActionButton(
      label: 'Add To Basket',
      onPressed: () {
      },
    ),
  );
}
}

